$TTL    604800
@       IN      SOA     ns1.lab8.ssi.es. root.lab8.ssi.es. (
                  3       ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
     IN      NS      ns1.lab8.ssi.es.

; name servers - A records
ns1.lab8.ssi.es.          		IN      A      192.168.8.2

obsolete.lab8.ssi.es.		     	IN      A      192.168.8.13
ingenieriainformatica.lab8.ssi.es.	IN      A      192.168.8.34
epi.lab8.ssi.es.		        IN      A      192.168.8.48
ssh.lab8.ssi.es.		        IN      A      192.168.8.51
vulnerable.lab8.ssi.es.	        	IN      A      192.168.8.69
kali.lab8.ssi.es.		        IN      A      192.168.8.73
samba.lab8.ssi.es.		        IN      A      192.168.8.84