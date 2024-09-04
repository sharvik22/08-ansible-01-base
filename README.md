# Домашнее задание к занятию 1 «Введение в Ansible» Шарапат Виктор

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.
10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---

### Решение

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.

* sudo apt update
* sudo apt install software-properties-common
* sudo apt-add-repository --yes --update ppa:ansible/ansible
* sudo apt install ansible
* ansible --version

![image](https://github.com/user-attachments/assets/0108cd1f-2160-4057-b292-68a4f6265499)


## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

![image](https://github.com/user-attachments/assets/ed5e525b-6828-4d60-9ce3-5f763e37475b)

Выполнение команды ansible-playbook -i inventory/test.yml site.yml запускает Ansible playbook на окружении, описанном в файле inventory/test.yml. В результате выполнения playbook'а были выполнены следующие шаги:

Gathering Facts: Ansible собирает факты (факты — это информация о хостах, такие как операционная система, IP-адрес, архитектура и т.д.).

Print OS: Выводит информацию об операционной системе хоста. В данном случае, значение "msg": "Ubuntu" указывает, что операционная система хоста — Ubuntu.

Print fact: Выводит значение переменной some_fact. В данном случае, значение "msg": 12 указывает, что переменная some_fact имеет значение 12.

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

Файл group_vars/all/examp.yml

![image](https://github.com/user-attachments/assets/853d28bf-9b84-4469-ad14-da2ebc17ea75)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

* sudo apt update
* sudo apt install -y docker docker-compose-v2
  
![image](https://github.com/user-attachments/assets/f31467a1-a4dc-47d5-b3fa-bc4db78f59b3)

* nano docker-compose.yml

![image](https://github.com/user-attachments/assets/dded015d-d93c-433e-b29c-994890cc8621)

* docker compose up -d

![image](https://github.com/user-attachments/assets/fad82ce1-e3bb-4cb5-954c-136015ebba52)

* docker container ls -a

![image](https://github.com/user-attachments/assets/47a10bec-5206-48d9-accb-7e60bf282b45)

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

* ansible-playbook -i inventory/prod.yml -v site.yml

![image](https://github.com/user-attachments/assets/737400f3-9b4f-43b0-a820-f9a891b81577)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

* nano group_vars/deb/examp.yml

![image](https://github.com/user-attachments/assets/62ff4361-e1c6-416d-96b6-7029f8b7b4b6)

* nano group_vars/el/examp.yml 

![image](https://github.com/user-attachments/assets/9dc60bed-0bfe-42ed-b189-24373e3689f7)

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

* ansible-playbook -i inventory/prod.yml -v site.yml

![image](https://github.com/user-attachments/assets/8bb513ed-e0a6-4b0f-ac3f-4ab2da1c9c21)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

* ansible-vault encrypt group_vars/deb/examp.yml

![image](https://github.com/user-attachments/assets/1b93579f-0733-4b14-a498-b0fa94c3d24c)

![image](https://github.com/user-attachments/assets/ad6c8e4f-b2fd-4bb1-baad-ab5a44dbd4f4)

* ansible-vault encrypt group_vars/el/examp.yml

![image](https://github.com/user-attachments/assets/09b6d2e8-60d5-450c-b18a-4b306979c237)

![image](https://github.com/user-attachments/assets/1da14989-3b9a-4ecb-8413-d20bb02dcafe)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

* ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

![image](https://github.com/user-attachments/assets/853439cc-2e94-492e-b2c1-aa7b6acf48aa)


9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

* ansible-doc -t connection -l

![image](https://github.com/user-attachments/assets/0e0f5838-23fe-42ce-913c-c9304ee02e41)

Эта команда выводит список всех доступных плагинов подключения. Среди них local, который предназначен для выполнения задач непосредственно на control node.

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

* nano inventory/prod.yml

![image](https://github.com/user-attachments/assets/a30c668e-afc8-4751-aade-df8814b84008)

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

* ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

![image](https://github.com/user-attachments/assets/77340db3-4c9f-42c3-b754-846928c27351)

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

13. Предоставьте скриншоты результатов запуска команд.







