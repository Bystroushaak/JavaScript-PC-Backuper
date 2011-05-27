echo "Unpacking jpb.."; base64 -d > /tmp/jpb.tmp <<EOF-
H4sICGoI4E0AA2pwYi5zaACdVEtP4zAQPje/YkgjSneV9KF9SBS6LJQe9kB7AO0BkHBjJ/E2tUvs
RID2x+/YidsAEoeV2rr+5mF/M9+4ewCDUhWDFRcDJipQmdeFP9tVpDKoRtEwGsLR+Hs0/BqNh6NR
H1bPcP6sdCFLlRGyhqNVsyPrszXXBL+qFCySRdr3vOX86tQf6M12YFJuic6U780sSFk1iHO+XUlS
UN9b7DxzSSgr8Hzf82KiGAQj4MIjlPa9TiIL4LiF4GwCVHqdDk/gFvyA+3CKy8iH+wnojAmIpdBc
lGwCCUc//OARDwUjNOdiDWFiox6gCynTkJR5DuaCtavNGhYQzK9cQkQ7LM4khs2vfJhOIUB6LZRD
FIFc+wixXLG95YKIngYkAL2A9w6Mg7kSlYJ5k4lHWd4ww8P+k1pasG1zMXMrmIItsEBWLlHwA0L2
CMM2HxsWVq8jzRJhJ4xDsanRw0PYVDvLG+aGFRRsIytGISnkBnKu9FuarMBmItFWyjr80hhQAuhj
4tAlJro+AiFFKhP1a3m+RIE4qaKcMP91gzqB4WrQmcMo0STSpIjSF8R/G+GNPCxXXY8uhKmGUase
RoTBGP9Y16Fn7+81LJckXnOR2uGIfIfa3zv/Rmzb5jt/Aitk9e0LhNSU1N4UTk4uF/PQN8DCFDB9
4Vj+GIIh/HX+U2dsilMHvAZdHOZuMqPdrlhUU18LTiDONpLC56fa2ErzlpMt1Aekavt7VrMWJ5db
yzLOGoVg7SGuXiC8rnuOQxei2JZGbePpTqLv2MOH9GMKA+wZ5g6fqqS+hiM+W75zNyRxwnsG60GM
L4Bm1JB1QjDdtrPR1oLV4KIeiFktV3OAzYuyQGV+6rsTbhRJ2bFp4y2JNZfiHgczZ/ZnDLvCOvef
1kcd7+rdwbdhv8H3YL+xU7PfNoPV7MxswK15te73YOfCMoRtTdu8FYQL10UggkJpG4uPbCtqxhJS
5tq+gcBVU67IjiVTJP4HRjzdnSkGAAA=
EOF-
gzip -c -d /tmp/jpb.tmp > /usr/bin/jpb && rm /tmp/jpb.tmp; chmod +x /usr/bin/jpb
echo "Unpacking data.."; base64 -d > /tmp/data.tar.gz <<EOF-
H4sIAIgI4E0AA+3OMQrCQBQE0BwlJ9Bd2ZjzJJUYxCW7Kby9SSEoCFaxeq8Z+DPFr7d8vObxkId6
Kc0+wuqc0pax78J7vjQxdv2a6RTXe0zbvA07/fNhKXWY27YZH6XO96UM0/fdrx4AAAAAAAAAAAD+
6Alkf3i+ACgAAA==
EOF-
cd /; tar -xvf /tmp/data.tar.gz && rm /tmp/data.tar.gz
