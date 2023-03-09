Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  config.vm.provision "shell", inline: <<-EOF
    apt install net-tools
    ifconfig
    snap install microk8s --classic
    microk8s.status --wait-ready
    microk8s.enable dns
    usermod -a -G microk8s vagrant
    echo "alias kubectl='microk8s.kubectl'" > /home/vagrant/.bash_aliases
    chown vagrant:vagrant /home/vagrant/.bash_aliases
    echo "alias kubectl='microk8s.kubectl'" > /root/.bash_aliases
    chown root:root /root/.bash_aliases
  EOF

  config.vm.define "microk8s_master_01" do |microk8s_master_01|
    microk8s_master_01.vm.hostname = "microk8s-master-01"
    microk8s_master_01.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_master_01.vm.network "private_network", ip: "192.168.56.2"
    microk8s_master_01.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-master-01"
    end
    microk8s_master_01.vm.provision "shell", inline: <<-EOF
      export local_ip="$(ip route | grep default | grep enp0s9 | cut -d' ' -f9)"
      echo $local_ip
      microk8s.add-node | grep $local_ip | tee /vagrant/add_k8s
    EOF
  end
  config.vm.define "microk8s_master_02" do |microk8s_master_02|
    microk8s_master_02.vm.hostname = "microk8s-master-02"
    microk8s_master_02.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_master_02.vm.network "private_network", ip: "192.168.56.3"
    microk8s_master_02.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-master-02"
    end
    microk8s_master_02.vm.provision "shell", inline: <<-EOF
      export local_ip="$(ip route | grep default | grep enp0s9 | cut -d' ' -f9)"
      echo $local_ip
      microk8s.add-node | grep $local_ip | tee /vagrant/add_k8s
    EOF
  end
  config.vm.define "microk8s_master_03" do |microk8s_master_03|
    microk8s_master_03.vm.hostname = "microk8s-master-03"
    microk8s_master_03.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_master_03.vm.network "private_network", ip: "192.168.56.4"
    microk8s_master_03.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-master-03"
    end
    microk8s_master_03.vm.provision "shell", inline: <<-EOF
      export local_ip="$(ip route | grep default | grep enp0s9 | cut -d' ' -f9)"
      microk8s.add-node | grep $local_ip | tee /vagrant/add_k8s
    EOF
  end
  config.vm.define "microk8s_worker_01" do |microk8s_worker_01|
    microk8s_worker_01.vm.hostname = "microk8s-worker-01"
    microk8s_worker_01.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_worker_01.vm.network "private_network",  ip: "192.168.56.5"
    microk8s_worker_01.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-woker-01"
    end
    microk8s_worker_01.vm.provision "shell", inline: <<-EOF
      export local_ip="$(ip route | grep default | grep enp0s9 | cut -d' ' -f9)"
      microk8s.add-node  | grep $local_ip | tee /vagrant/add_k8s --worker
    EOF
  end
  config.vm.define "microk8s_worker_02" do |microk8s_worker_02|
    microk8s_worker_02.vm.hostname = "microk8s-worker-02"
    microk8s_worker_02.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_worker_02.vm.network "private_network", ip: "192.168.56.6"
    microk8s_worker_02.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-worker-02"
    end
    microk8s_worker_02.vm.provision "shell", inline: <<-EOF
      export local_ip="$(ip route | grep default | grep enp0s9 | cut -d' ' -f9)"
      microk8s.add-node | grep $local_ip | tee /vagrant/add_k8s
    EOF
  end
  config.vm.define "microk8s_worker_03" do |microk8s_worker_03|
    microk8s_worker_03.vm.hostname = "microk8s-worker-03"
    microk8s_worker_03.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_worker_03.vm.network "private_network", ip: "192.168.56.7"
    microk8s_worker_03.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-worker-03"
    end
    microk8s_worker_03.vm.provision "shell", inline: <<-EOF
      bash -x /vagrant/add_k8s
    EOF
  end
  config.vm.define "microk8s_worker_04" do |microk8s_worker_04|
    microk8s_worker_04.vm.hostname = "microk8s-worker-04"
    microk8s_worker_04.vm.network "public_network", bridge: "Realtek Gaming GbE Family Controller"
    microk8s_worker_04.vm.network "private_network",  ip: "192.168.56.8"
    microk8s_worker_04.vm.provider "virtualbox" do |vb|
      vb.name = "microk8s-worker-04"
    end
    microk8s_worker_04.vm.provision "shell", inline: <<-EOF
      bash -x /vagrant/add_k8s
    EOF
  end
end