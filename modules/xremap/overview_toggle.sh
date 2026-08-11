#!/usr/bin/env bash

state=$(busctl --user get-property org.gnome.Shell /org/gnome/Shell org.gnome.Shell OverviewActive | awk '{print $2}')

if [ "${state}" = "true" ]; then
  state="false"
else
  state="true"
fi

busctl --user set-property org.gnome.Shell /org/gnome/Shell org.gnome.Shell OverviewActive b "${state}"
