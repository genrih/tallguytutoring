# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/tgt/www/tgt/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/tgt/www/tgt/current/tmp/pids/unicorn.pid"

# Path to logs
stderr_path "/home/tgt/www/tgt/current/log/unicorn.log"
stdout_path "/home/tgt/www/tgt/current/log/unicorn.log"

# Unicorn socket
#listen "/tmp/unicorn.[app name].sock"
listen "/home/tgt/www/tgt/shared/unicorn.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
