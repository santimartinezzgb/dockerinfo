# Docker Info Bash Script to _LINUX_

This is a simple Bash script that displays key Docker information in your system:

- 📦 Docker images
- ▶️ Running containers
- 📋 All containers (running and stopped)


## Requirements

- Docker installed and running
- Bash shell (tested with Bash 4+)


## What It Does

The script shows:

1. **All Docker images** (`docker images`)
2. **Running containers** (`docker ps`)
3. **All containers** (`docker ps -a`)



## How to Use

1. **Clone the repository**:

   ```bash
   git clone https://github.com/santimartinezzgb/dockerinfo.git
   cd dockerinfo

2. **Make the script executable**

   ```bash
   chmod +x dockerinfo.sh
   ```
3. **Run the script**

   ```bash
   ./dockerinfo.sh
   ```


## Future improvements

   Add the option for windows

## License
This project is licensed under the MIT License. See the LICENSE
file for more details.
