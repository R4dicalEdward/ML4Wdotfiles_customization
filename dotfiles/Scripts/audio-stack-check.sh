#!/bin/bash

echo "===== Audio Stack Diagnostic ====="
echo

echo "-- Systemd User Services --"
systemctl --user is-active pipewire && echo "✅ PipeWire is running"
systemctl --user is-active pipewire-pulse && echo "✅ pipewire-pulse (Pulse emulation) is running"
systemctl --user is-active wireplumber && echo "✅ WirePlumber is running"
systemctl --user is-active pulseaudio && echo "⚠️  PulseAudio is running (legacy)"
systemctl --user is-active jack && echo "⚠️  JACK is running"

echo
echo "-- Running Processes --"
ps -e | grep -E 'pipewire|pulseaudio|jackd' || echo "🔍 No relevant audio daemons found"

echo
echo "-- pactl Info --"
if command -v pactl &>/dev/null; then
    pactl info | grep -E 'Server Name|Server String'
else
    echo "pactl not installed"
fi

echo
echo "-- PipeWire Node Check --"
if command -v pw-cli &>/dev/null; then
    pw-cli list-objects | grep "Audio/Sink" && echo "✅ PipeWire nodes present"
else
    echo "pw-cli not installed"
fi

echo
echo "-- ALSA to PipeWire Check --"
aplay -L | grep -i pipewire && echo "✅ ALSA is routed to PipeWire" || echo "⚠️  ALSA not routed to PipeWire"

echo
echo "===== Diagnostic Complete ====="
