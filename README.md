# glances

[Glances](https://nicolargo.github.io/glances/) is a cross-platform monitoring tool which aims to present a large amount of monitoring information through a curses or Web based interface. The information dynamically adapts depending on the size of the user interface.

## Usage/Examples

Add it to your application by adding the following service to your `docker-compose.yml` file:

```yaml
glances:
  image: balenablocks/glances
  privileged: true
  network_mode: host
  pid: host
  labels:
    io.balena.features.dbus: "1"
```

Add the [balenablocks/fbcp](https://github.com/balenablocks/fbcp/) block if you are using a RaspberryPi and have a PiDisplay or TFT attached.

## Environment Variables

| Name       | Purpose                                                                                                 |
| ---------- | ------------------------------------------------------------------------------------------------------- |
| `FONTFACE` | Change terminal font face via [console-setup](https://www.mankier.com/5/console-setup#Options-FONTFACE) |
| `FONTSIZE` | Change terminal font size via [console-setup](https://www.mankier.com/5/console-setup#Options-FONTFACE) |
