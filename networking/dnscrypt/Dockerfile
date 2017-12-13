FROM debian:jessie

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc cmake libpcap-dev libsodium-dev openssl wget ca-certificates make build-essential libssl-dev dnsutils && \
    rm -rf /var/lib/apt/lists/*

ARG version=0.4.9.4
RUN wget https://github.com/chengr28/Pcap_DNSProxy/archive/v${version}.tar.gz -O Pcap_DNSProxy.tar.gz && \
    gzip -d Pcap_DNSProxy.tar.gz && tar -xf Pcap_DNSProxy.tar && rm Pcap_DNSProxy.tar && \
    mv Pcap_DNSProxy-${version} Pcap_DNSProxy
RUN cd Pcap_DNSProxy/Source/Auxiliary/Scripts/ && \
    chmod +x CMake_Build.sh && sh ./CMake_Build.sh
RUN cp Pcap_DNSProxy/Source/Release/Pcap_DNSProxy /usr/bin/ && chmod +x /usr/bin/Pcap_DNSProxy

CMD [ "Pcap_DNSProxy", "--disable-daemon", "-c", "/Pcap_DNSProxy/Source/Release" ]