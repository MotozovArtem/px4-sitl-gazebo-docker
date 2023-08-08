# Px4 SITL (Software In The Loop) with Gazebo Simulation Docker

This Docker image allows you build and run Px4 SITL Gazebo Simulation.

## How to build

Build Docker image from Dockerfile:

```bash
docker build -t px4-sitl-gazebo .
```

## How to run

### With default location 

Run Px4 SITL wth Gazebo simulation with default location:

```bash
docker run -it -p 14540:14540/udp -p 5760:5760 \
    --name px4-sitl-gazebo-container-name 
    px4-sitl-gazebo
```

### With specified location

Run Px4 SITL wth Gazebo simulation with specified location:

```bash
docker run -it -p 14540:14540/udp -p 5760:5760 \
    --env PX4_HOME_LAT=56.8625617
    --env PX4_HOME_LON=24.1131178
    --env PX4_HOME_ALT=11.86
    --name px4-sitl-gazebo-container-name 
    px4-sitl-gazebo
```
