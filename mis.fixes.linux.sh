#!/bin/bash
set -e

##### Fix thumbnails issue
# Change default thumbnailer for videos
sudo apt install -y \
    ffmpegthumbnailer \
    gstreamer1.0-libav


export THUMBNAILERS_DIR=/usr/share/thumbnailers
# Disable totem
sudo mv $THUMBNAILERS_DIR/totem.thumbnailer $THUMBNAILERS_DIR/totem.thumbnailer.disabled
# backup original ffmpeg
sudo mv $THUMBNAILERS_DIR/ffmpegthumbnailer.thumbnailer $THUMBNAILERS_DIR/ffmpegthumbnailer.thumbnailer.backup
# Update
echo "[Thumbnailer Entry]
TryExec=ffmpegthumbnailer-wrapper
Exec=ffmpegthumbnailer-wrapper %i %o %s
MimeType=video/jpeg;video/mp4;video/mpeg;video/quicktime;video/x-ms-asf;video/x-ms-wm;video/x-ms-wmv;video/x-ms-asx;video/x-ms-wmx;video/x-ms-wvx;video/x-msvideo;video/x-flv;video/x-matroska;application/mxf;video/3gp;video/3gpp;video/dv;video/divx;video/fli;video/flv;video/mp2t;video/mp4v-es;video/msvideo;video/ogg;video/vivo;video/vnd.divx;video/vnd.mpegurl;video/vnd.rn-realvideo;application/vnd.rn-realmedia;video/vnd.vivo;video/webm;video/x-anim;video/x-avi;video/x-flc;video/x-fli;video/x-flic;video/x-m4v;video/x-mpeg;video/x-mpeg2;video/x-nsv;video/x-ogm+ogg;video/x-theora+ogg;MimeType=application/mxf;application/ram;application/sdp;application/vnd.apple.mpegurl;application/vnd.ms-asf;application/vnd.ms-wpl;application/vnd.rn-realmedia;application/vnd.rn-realmedia-vbr;application/x-extension-m4a;application/x-extension-mp4;application/x-flash-video;application/x-matroska;application/x-netshow-channel;application/x-quicktimeplayer;application/x-shorten;image/vnd.rn-realpix;image/x-pict;misc/ultravox;text/x-google-video-pointer;video/3gp;video/3gpp;video/3gpp2;video/dv;video/divx;video/fli;video/flv;video/mp2t;video/mp4;video/mp4v-es;video/mpeg;video/mpeg-system;video/msvideo;video/ogg;video/quicktime;video/vivo;video/vnd.divx;video/vnd.mpegurl;video/vnd.rn-realvideo;video/vnd.vivo;video/webm;video/x-anim;video/x-avi;video/x-flc;video/x-fli;video/x-flic;video/x-flv;video/x-m4v;video/x-matroska;video/x-mjpeg;video/x-mpeg;video/x-mpeg2;video/x-ms-asf;video/x-ms-asf-plugin;video/x-ms-asx;video/x-msvideo;video/x-ms-wm;video/x-ms-wmv;video/x-ms-wmx;video/x-ms-wvx;video/x-nsv;video/x-ogm+ogg;video/x-theora;video/x-theora+ogg;video/x-totem-stream;application/x-flac
" > $THUMBNAILERS_DIR/ffmpegthumbnailer.thumbnailer

# Remove existing thumbnails
rm -rf ~/.cache/thumbnails
