# Firewall-Worker:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) ![Firewall Worker](https://github.com/user-attachments/assets/ac20b82c-8986-4e8d-b232-657beb5f6823)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) ![122025](https://github.com/user-attachments/assets/2123510b-f411-4624-a2fc-695ffb3c4b70)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

In computing, a firewall is a [network security](https://en.wikipedia.org/wiki/Network_security) system that [monitors](https://en.wikipedia.org/wiki/Network_monitoring) and controls incoming and outgoing [network traffic](https://en.wikipedia.org/wiki/Network_traffic) based on configurable security rules. A firewall typically establishes a barrier between a trusted network and an untrusted network, such as the Internet or between several [VLANs](https://en.wikipedia.org/wiki/VLAN). Firewalls can be categorized as network-based or host-based.

</br>

### Features:
* Scan Rule list (In-, Outbound)
* Delete Rule seperate (In-, Outbound)
* Create Rule
  * Inbound, Outbound, Application, ICMP, Protocol, LAN, Serice, EdgeTraversal, Interface

</br>

![FirewallWorker](https://github.com/user-attachments/assets/3c1f9a97-4d9d-4a27-b21e-4908402050b3)

</br>

# Types of firewalls:
Firewalls are categorized as a network-based or a host-based system. Network-based firewalls are positioned between two or more networks, typically between the [local area network](https://en.wikipedia.org/wiki/Local_area_network) (LAN) and [wide area network](https://en.wikipedia.org/wiki/Wide_area_network) (WAN), their basic function being to control the flow of data between connected networks. They are either a software appliance running on general-purpose hardware, a hardware appliance running on special-purpose hardware, or a [virtual appliance](https://en.wikipedia.org/wiki/Virtual_appliance) running on a virtual host controlled by a hypervisor. Firewall appliances may also offer non-firewall functionality, such as [DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) or [VPN](https://en.wikipedia.org/wiki/Virtual_private_network) services. Host-based firewalls are deployed directly on the host itself to control network traffic or other computing resources. This can be a [daemon](https://en.wikipedia.org/wiki/Daemon_(computing)) or service as a part of the operating system or an agent application for protection.

</br>

| Interface Types:              | Description;  |
| :-------------------------- | :----------- |
| Physical/Layer 3 Interfaces |Standard Ethernet ports assigned IP addresses for routing traffic (e.g., WAN, LAN). |
| Virtual Wire (VWire) | Acts like a simple cable (Layer 2) for inline inspection without IP, preventing direct communication between networks. |
| TAP (Test Access Point) | A passive, out-of-band interface that mirrors traffic for inspection without impacting network flow, as seen in Palo Alto firewalls. |
| Layer 2 Interfaces | Operates at Layer 2 (Ethernet), bridging traffic like a switch, often used for transparent deployments. |
| VLAN Interfaces/Sub-interfaces | Logically segments a single physical port into multiple virtual networks (802.1Q), enabling traffic separation. |
| Aggregate Ethernet (LAG) | Combines multiple physical links into one logical link for increased bandwidth and redundancy. |
| Tunnel Interfaces | Used for VPNs (IPsec, GRE) to create secure, encrypted connections between sites or for remote users. |
| Loopback | A virtual interface that's always "up," used for management, routing protocols (OSPF), and internal stability. |
| HA (High Availability) | Dedicated interfaces for cluster communication between primary and secondary firewalls. |
| Software/Hardware Switches | Virtual switches (CPU-based) or hardware-accelerated switches for managing internal traffic and VLANs.  |

</br>

# Packet Filter:
The first reported type of network firewall is called a [packet filter](https://en.wikipedia.org/wiki/PF_(firewall)) which inspects packets transferred between computers. The firewall maintains an [access-control](https://en.wikipedia.org/wiki/Access-control_list) list which dictates what packets will be looked at and what action should be applied, if any, with the default action set to silent discard. Three basic actions regarding the packet consist of a silent discard, discard with [Internet Control Message Protocol](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol) or TCP reset response to the sender, and forward to the next hop. Packets may be filtered by source and destination IP addresses, protocol, or source and destination ports. The bulk of Internet communication in 20th and early 21st century used either Transmission Control Protocol (TCP) or User Datagram Protocol (UDP) in conjunction with [well-known ports](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers), enabling firewalls of that era to distinguish between specific types of traffic such as web browsing, remote printing, email transmission, and file transfers.

</br>

<img width="250" height="137" alt="Firewall" src="https://github.com/user-attachments/assets/28312bdb-1d7b-4cf4-83d3-ad8874bc534c" />

</br>


The first paper published on firewall technology was in 1987 when engineers from [Digital Equipment Corporation](https://en.wikipedia.org/wiki/Digital_Equipment_Corporation) (DEC) developed filter systems known as packet filter firewalls. At AT&T Bell Labs, Bill Cheswick and Steve Bellovin continued their research in packet filtering and developed a working model for their own company based on their original first-generation architecture.




