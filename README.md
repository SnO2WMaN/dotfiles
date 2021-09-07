## Require Manually

### Sway Desktop Entry

move `./etc/sway-session` to `/usr/local/bin/sway-session` and `chmod u+x`

and rewrite `/usr/share/wayland-sessions/sway.desktop`

```/usr/share/wayland-sessions/sway.desktop
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=/usr/local/bin/sway-session
Type=Application
```
