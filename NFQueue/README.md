# netfilter

netfilter and iptables best-practise
Launch the program as root, either with a destination pcap file or not, and send any ipv4 traffic that you want to it.

---------
$ yum install conntrack-tools -y && yum install libnetfilter_queue-devel.x86_64 -y

$ gcc -g -Wall -o nfqueue_recorder nfqueue_recorder.c -lnetfilter_queue -lpcap

$ sudo ./nfqueue_recorder -o todays-traffic.pcap

$ sudo iptables -I FORWARD -j NFQUEUE
---------

stdout will output the ip/tcp/udp headers in the console

dependencies:
 * libpcap-dev
 * libnetfilter-queue-dev

you can open the pcap file with tcpdump or wireshark:
---------
$ tcpdump -qns 0 -X -r todays-traffic.pcap
---------
