#!/bin/bash

## simple script to send html email over netcat
## r1ddl3r

echo "Enter target MX domain: "
read domain
echo "Enter SMTP port #: "
read port
echo "Enter mail from address: "
read fromaddr
echo "Enter mail from name: "
read fromname
echo "Enter mail recipient address: "
read rcpaddr
echo "Enter mail recipient name: "
read rcpname
echo "Enter mail subject: "
read subject
echo "Enter msg body in html: "
read body


if [[ $domain != "" ]]; then
	echo "generating email..."
	echo "********************************************"
	compose email msg... echo line by line into tmp.txt file
		echo "HELO $domain" >> msg_tmp.txt
		echo "MAIL FROM:<$fromaddr>" >> msg_tmp.txt
		echo "RCPT TO::<$rcpaddr>" >> msg_tmp.txt
		echo "DATA" >> msg_tmp.txt
		echo "From: [$fromname] <$fromaddr>" >> msg_tmp.txt
		echo "To: [$rcpname] <$rcpaddr>" >> msg_tmp.txt
		echo "Subject: $subject" >> msg_tmp.txt
		echo "Mime-Version: 1.0;" >> msg_tmp.txt
		echo 'Content-Type: text/html; charset="ISO-8859-1";' >> msg_tmp.txt
		echo "Content-Transfer-Encoding: 7bit;" >> msg_tmp.txt
		echo "" >> msg_tmp.txt
		echo "" >> msg_tmp.txt
		echo "$body" >> msg_tmp.txt
		echo "." >> msg_tmp.txt
		echo "QUIT" >> msg_tmp.txt
        echo "sending email via netcat..."
        echo "********************************************"
	nc -vv $domain $port < msg_tmp.txt
        echo "done!"


else
	echo "Error! Please enter a domain... "
fi
