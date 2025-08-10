# The Great Firewall!

To circumvent the great firewall, many programs need to use different mirror, registry, in China. 

## Pacman

In manjaro, we can use `pacman-mirror` to update the mirror list automatically.
Try

```
sudo pacman-mirror -geoip  # use mirror in the geographical location
sudo pacman-mirrors --fasttrack 5  # benchmarking mirrors and get 5 fastest
```

Recall to use 

```
sudo pacman -Syyu  # or
sudo pacman -Syy  # or 
sudo pacman -Syyuu
```

To sync the database before updating the system with

```
sudo pacman -Syu
```

You may also use, as shown in the Arch Wiki,

```
curl -s "https://archlinux.org/mirrorlist/?country=FR&country=GB&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -
```

## Docker 

Docker registry is modified through `/etc/docker/daemon.json`.
Use aliyun [mirror](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)

Recall to use 

```
sudo systemctl daemon-reload && sudo systemctl restart docker
```

## Rust 

Create `config.toml` in `~/.cargo` and add the following lines.

```
# ~/.cargo/config.toml
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
```

