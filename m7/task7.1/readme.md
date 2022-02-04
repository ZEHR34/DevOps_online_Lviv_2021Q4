# Create a script that uses the following keys:

спершу потрібно перевірити вхідні дані
якщо потрібно просканувати всю мережу, то використовуючи ifconfig, hostname, ip a отримаємо адресу мережі з маскою. потім скануємо всіх можливих хостів nmap -sn $NETADDR/$MASK

якщо потрібно просканувати хост робимо це за допомогою nmap

# Using Apache log example create a script to answer the following questions:

комбінуємо awk, sort, uniq, grep для отримання потрібної інформації

# Create a data backup script that takes the following data as parameters:

Спершу перевіримо чи було задані 2 директорії. далі створимо файд log.info в якому будемо записувати дату дії над файлом і тип операцію. Також будем копіювати всі файли для збереження їх копій.