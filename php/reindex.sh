RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ ! -f bin/change.phar ]; then
  printf "${RED}[!] You must be at the root path of your Proximis project to reindex (change.phar file not found)${NC}\n"
  exit
fi

php bin/change.phar rbs_elasticsearch:index -p
php bin/change.phar rbs_catalog:axes-indexing -r
php bin/change.phar rbs_generic:attribute-filter-index

printf "\n\n${GREEN}[+] Your project has been successfully reindexed${NC}\n"
