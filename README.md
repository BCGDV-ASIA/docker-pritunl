# Pritunl Docker Image

Image based off Ubuntu LTS. Installs and enable pritunl systemd service.

## Configuration

Configuration            | Description | Default
-------------------------|-------------|---------
 SETUP_KEY               | Custom setup-key for pritunl database | -
 MONGODB_URI             | Mongodb URI | mongodb://localhost:27017/pritunl
 PRITUNL_REVERSE_PROXY   | Enable/disable reverse proxy | false
 PRITUNL_SERVER_SSL      | Enable/disable server ssl | true
 PRITUNL_SERVER_PORT     | Server port | 443

## Running

### Full Example - Running behind ELB
```shell
docker run \
    -p 80:80 \
    -p 9700:9700 \
    -p 1234:1234/udp \
    -e SETUP_KEY=magic \
    -e MONGODB_URI=mongodb://localhost:27017/pritunl \
    -e PRITUNL_REVERSE_PROXY=true \
    -e PRITUNL_SERVER_SSL=false \
    -e PRITUNL_SERVER_PORT=9700 \
    -d pritunl
```

### Docker compose example

Check out the [example](example) folder