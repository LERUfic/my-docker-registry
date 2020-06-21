repositories=( $(curl -u USER:PASSWORD -s https://registry.aguelsatria.web.id/v2/_catalog | grep -o '"[^"]*"') )

docker exec registry registry garbage-collect /etc/docker/registry/config.yml

for i in ${repositories[@]//\"/}; do
		curl -u USER:PASSWORD -s https://registry.aguelsatria.web.id/v2/${i}/tags/list | egrep '"tags":null|NAME_UNKNOWN';
		if [ $? -eq 0 ]; then
		docker exec -it registry rm -rf /var/lib/registry/docker/registry/v2/repositories/$i
		echo "delete empty repository $i"
		fi
done
