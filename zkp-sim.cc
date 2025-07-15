#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include <iostream>
#include <fstream>
#include <cstdlib>

using namespace ns3;

enum SchemeType {
    PROPOSED = 0,
    BASELINE_CRYPTO_ONLY = 1,
    BASELINE_COOP_SWAP = 2
};

NS_LOG_COMPONENT_DEFINE("ZkpSim");

std::ofstream csvLog("privacy_results.csv");

double GenerateRandomSilentPeriod(double Tmin, double Tmax) {
    double Rf = (double)rand() / RAND_MAX;
    return Tmin + Rf * (Tmax - Tmin);
}

double SimulateZKPVerification() { return 0.1; }
double SimulateBlockchainTx() { return 0.2; }
bool ZKPSuccess(double prob = 0.95) {
    return ((double)rand() / RAND_MAX) <= prob;
}

void LogVehicleAction(int vid, std::string msg, double time) {
    NS_LOG_INFO("Vehicle " << vid << ": " << msg << " at " << time << "s");
}

void InstallVehicleApp(NodeContainer vehicles, SchemeType scheme) {
    double Tmin = 1.0, Tmax = 5.0;

    for (uint32_t i = 0; i < vehicles.GetN(); ++i) {
        Ptr<Node> vehicle = vehicles.Get(i);
        double baseStart = 1.0 + i * 0.5;

        if (scheme == PROPOSED) {
            Simulator::Schedule(Seconds(baseStart), [i, Tmin, Tmax]() {
                double Tsilent = GenerateRandomSilentPeriod(Tmin, Tmax);
                LogVehicleAction(i, "Entering silent period (T_silent = " + std::to_string(Tsilent) + "s)", Simulator::Now().GetSeconds());

                Simulator::Schedule(Seconds(Tsilent), [i, Tsilent]() {
                    LogVehicleAction(i, "Requesting IT via RSU", Simulator::Now().GetSeconds());
                    LogVehicleAction(i, "RSU forwards ZKP to Blockchain", Simulator::Now().GetSeconds());

                    double zkpDelay = SimulateZKPVerification();
                    Simulator::Schedule(Seconds(zkpDelay), [i, Tsilent, zkpDelay]() {
                        bool pass = ZKPSuccess();
                        if (!pass) {
                            LogVehicleAction(i, "ZKP Failed — IT Denied", Simulator::Now().GetSeconds());
                            csvLog << i << ",PROPOSED," << Tsilent << ",FAIL,0,0\n";
                            return;
                        }

                        LogVehicleAction(i, "ZKP Passed — Issuing IT", Simulator::Now().GetSeconds());

                        double blkDelay = SimulateBlockchainTx();
                        Simulator::Schedule(Seconds(blkDelay), [i, Tsilent, zkpDelay, blkDelay]() {
                            double totalDelay = Tsilent + zkpDelay + blkDelay;
                            LogVehicleAction(i, "Blockchain confirmed — Broadcasting pseudonym", Simulator::Now().GetSeconds());
                            csvLog << i << ",PROPOSED," << Tsilent << ",PASS," << blkDelay << "," << totalDelay << "\n";
                        });
                    });
                });
            });
        }

        else if (scheme == BASELINE_CRYPTO_ONLY) {
            Simulator::Schedule(Seconds(baseStart), [i]() {
                LogVehicleAction(i, "Preparing ECC-signed pseudonym", Simulator::Now().GetSeconds());
                Simulator::Schedule(Seconds(0.1), [i]() {
                    LogVehicleAction(i, "Broadcasting signed ECC pseudonym", Simulator::Now().GetSeconds());
                    csvLog << i << ",BASELINE_CRYPTO_ONLY,0,N/A,0,0.1\n";
                });
            });
        }

        else if (scheme == BASELINE_COOP_SWAP) {
            Simulator::Schedule(Seconds(baseStart), [i]() {
                LogVehicleAction(i, "Initiating pseudonym swap", Simulator::Now().GetSeconds());
                Simulator::Schedule(Seconds(0.3), [i]() {
                    LogVehicleAction(i, "Swap done — notifying authority", Simulator::Now().GetSeconds());
                    Simulator::Schedule(Seconds(0.2), [i]() {
                        LogVehicleAction(i, "Authority acknowledged swap", Simulator::Now().GetSeconds());
                        csvLog << i << ",BASELINE_COOP_SWAP,0,N/A,0,0.5\n";
                    });
                });
            });
        }
    }
}
int main(int argc, char *argv[]) {
    std::cout<<"Entered main()\n"; 

    LogComponentEnable("ZkpSim", LOG_LEVEL_INFO);
    LogComponentEnableAll(LOG_PREFIX_TIME);

    csvLog << "VehicleID,Scheme,SilentPeriod,ZKPStatus,BlockchainDelay,TotalDelay\n";

    int numVehicles = 50;  // updated number of vehicles
    double offset = 0.0;

    for (int scheme = 0; scheme <= 2; ++scheme) {
        std::cout << "Scheduling scheme: " << scheme << std::endl;
        NodeContainer vehicles;
        vehicles.Create(numVehicles);
        InstallVehicleApp(vehicles, static_cast<SchemeType>(scheme));
        offset += numVehicles * 0.5 + 5;  // offset simulation time
    }

    Simulator::Stop(Seconds(1000));
    Simulator::Run();
    Simulator::Destroy();

    csvLog.close();
    return 0;
}
