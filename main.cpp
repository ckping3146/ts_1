#include <iostream>
#include <cstring>
//#include "../../include/utils.h"

using namespace std;

int main(int argc, char ** argv) {
    if (argc == 1)
    {
        cout << "Usage : << argv[0] << <file path>" << endl;
        return -1;
    }
    char *filePath = argv[1];
    unsigned short pktpid = 66; 

    int fileNameLen = strlen(filePath);
    if (fileNameLen <= 3)
    {
        cout << "File path length not correct. need *.ts file" << endl;
        return -1;
    }

    if (0 != strncmp(".ts", filePath+fileNameLen-3, 3))
    {
        cout << "File path type not correct. need *.ts file" << endl;
        return -1;
    }

    if (argc >= 3)
    {
        pktpid = atoi(argv[2]);
        cout << "Got Packet Pid " << pktpid << "." << endl;
    }

    cout << "App Start" << endl << endl;

    //read_pkts_haed_info(TestFileName);
    //parse_pkts_data(filePath, pktpid);

    cout << endl << "App ends" << endl;
    return 0;
}


