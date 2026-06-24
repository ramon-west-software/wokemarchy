import socket
import ipaddress
import threading
import queue
import platform
import sys

# Configuration
TARGET_PORT = 2283
TIMEOUT = 0.5  # Seconds to wait for a response per IP
MAX_THREADS = 50  # Number of simultaneous scans

def get_network_range():
    """
    Automatically detects the local network range (e.g., 192.168.1.0/24).
    """
    hostname = socket.gethostname()
    try:
        # Get local IP
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        local_ip = s.getsockname()[0]
        s.close()
        
        # Determine subnet mask (simplified for common home networks)
        # We assume a standard /24 (255.255.255.0) for simplicity, 
        # but you can adjust this if your network is different.
        network = ipaddress.IPv4Network(f"{local_ip}/24", strict=False)
        return network
    except Exception as e:
        print(f"Error detecting network: {e}")
        return None

def scan_single_ip(ip_str, port, results_queue):
    """
    Attempts to connect to a specific IP and port.
    """
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(TIMEOUT)
        result = sock.connect_ex((ip_str, port))
        sock.close()
        
        if result == 0:
            results_queue.put((ip_str, "OPEN"))
        else:
            # Port closed or filtered
            pass
    except Exception:
        pass

def scan_network(network, port, max_threads):
    """
    Scans all IPs in the network range using threads.
    """
    print(f"Starting scan of {network} for port {port}...")
    print(f"Using {max_threads} concurrent threads.")
    print("-" * 40)
    
    results_queue = queue.Queue()
    threads = []
    
    # Create a list of all IPs in the network (excluding network and broadcast addresses)
    hosts = [str(ip) for ip in network.hosts()]
    
    total_hosts = len(hosts)
    print(f"Scanning {total_hosts} hosts...")
    
    def worker():
        while True:
            try:
                ip = hosts.pop(0)
            except IndexError:
                break
            
            scan_single_ip(ip, port, results_queue)
            
            # Optional: Print progress every 50 hosts
            if len(hosts) % 50 == 0:
                remaining = len(hosts)
                print(f"Progress: {total_hosts - remaining}/{total_hosts} scanned...", end='\r')

    # Start threads
    for _ in range(max_threads):
        t = threading.Thread(target=worker)
        t.start()
        threads.append(t)

    # Wait for all threads to finish
    for t in threads:
        t.join()

    # Collect results
    open_ports = []
    while not results_queue.empty():
        ip, status = results_queue.get()
        open_ports.append(ip)

    print("\n" + "-" * 40)
    if open_ports:
        print(f"✅ FOUND {len(open_ports)} host(s) with port {port} OPEN:")
        for ip in sorted(open_ports):
            print(f"   - {ip}")
    else:
        print(f"❌ No hosts found with port {port} open on the network.")

if __name__ == "__main__":
    # Allow custom port via command line if needed
    port_to_scan = TARGET_PORT
    if len(sys.argv) > 1:
        try:
            port_to_scan = int(sys.argv[1])
        except ValueError:
            print("Invalid port number.")
            sys.exit(1)

    network = get_network_range()
    if network:
        scan_network(network, port_to_scan, MAX_THREADS)
    else:
        print("Could not determine network range. Please check your connection.")
