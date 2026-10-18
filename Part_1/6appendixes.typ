#import "@preview/modern-g7-32:0.2.0": appendixes, appendix-heading

#show: appendixes

#set page(flipped: true)

// Разрешаем длинным таблицам переноситься на следующую страницу. В сочетании
// с repeat: true в table.header строка-шапка повторяется на каждой странице
// (продолжение таблицы оформляется средствами шаблона). Рисунки при этом
// остаются неразрывными, чтобы подпись не отрывалась от изображения.
#show figure.where(kind: table): set block(breakable: true)

// Таблицы приложений набираются уменьшенным кеглем (допускается ГОСТ для
// больших таблиц). Шрифт остаётся тем же, что и в основном тексте.

// ============================================================================
//  ПРИЛОЖЕНИЕ А — таблицы
// ============================================================================

//#appendix-heading("справочное")[Классификационные и сравнительные таблицы]

= Классификационные и сравнительные таблицы <app-a>

В приложении приведены полные версии основных таблиц первого этапа работы:
классификация инцидентов информационной безопасности в контейнерных средах
(Таблица @tbl-incidents) и уровневая классификация цифровых артефактов с указанием
источников и свойств их получения (таблица @tbl-artifacts).

#figure(
  text(size: 10pt)[
    #set smartquote(enabled: false)
    #table(
      columns: (1.0fr, 1.2fr, 0.78fr, 1.5fr, 2.1fr, 1.55fr),
      inset: 4pt,
      align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
      stroke: 0.5pt,
      table.header(
        repeat: true,
        strong[Класс], strong[Подкласс], strong[Уровень атаки],
        strong[Техники (MITRE ATT\&CK)], strong[Диагностические признаки (IoC)],
        strong[Ключевые источники артефактов],
      ),

      // --- Класс 1 ---
      table.cell(rowspan: 4)[Компрометация формирования и доставки образа],
      [Компрометация целостности образа], [Образ / реестр],
      [Supply Chain Compromise (T1195.002); Implant Internal Image (T1525)],
      [Расхождение digest-хеша с эталонным; нетипичные бинарные файлы в слоях; повторная публикация тега без коммита в VCS],
      [docker history; манифест реестра; digest; Cosign-подпись],

      [Использование уязвимого образа], [Образ / реестр],
      [Exploit Public-Facing Application (T1190)],
      [Уязвимости с CVSS ≥ 7.0 в SBOM; устаревшие версии пакетов ОС или среды выполнения],
      [SBOM; результаты Trivy/Grype; конфигурация образа],

      [Компрометация зависимостей], [Образ (слой сборки)],
      [Supply Chain Compromise (T1195.001)],
      [Пакет из публичного репозитория совпадает по имени с внутренним; неожиданная версия в lock-файле],
      [SBOM; lock-файлы; Dockerfile; логи сборки],

      [Компрометация CI/CD-пайплайна], [CI/CD],
      [Build Image on Host (T1612); Unsecured Credentials (T1552)],
      [curl | bash в Dockerfile; несанкционированные шаги в pipeline; секреты в слоях образа],
      [CI/CD audit log; Dockerfile; docker history; переменные окружения сборки],

      // --- Класс 2 ---
      table.cell(rowspan: 3)[Инциденты в контейнере (runtime)],
      [Несанкционированное выполнение команд], [Контейнер],
      [Exploitation for Execution (T1203); Container Administration Command (T1609)],
      [bash/sh дочерним процессом веб-сервера; wget/curl внутри контейнера; kubectl/docker exec нештатным субъектом],
      [Изменяемый слой ФС; kube-apiserver audit log; eBPF/syscall события],

      [Модификация ФС и персистентность], [Контейнер],
      [Server Software Component (T1505); Scheduled Task/Job (T1053)],
      [Запись в /etc/crontab, .bashrc, /etc/rc.local; новые исполняемые файлы; backdoor-процессы],
      [Изменяемый слой ФС; overlay diff; inotify/eBPF события],

      [Эксфильтрация и C2], [Контейнер / сеть],
      [Exfiltration Over C2 Channel (T1041); Application Layer Protocol (T1071)],
      [Исходящие соединения на нестандартные порты; периодические beacon-запросы; аномальный объём трафика],
      [NetFlow; CNI-логи; DNS-логи; стандартный поток вывода],

      // --- Класс 3 ---
      table.cell(rowspan: 3)[Нарушение изоляции],
      [Побег через мисконфигурацию], [Хост / ядро ОС],
      [Escape to Host (T1611)],
      [\-\-privileged; CAP_SYS_ADMIN; hostPID: true; монтирование /var/run/docker.sock],
      [PodSpec; docker inspect; auditd; mount info],

      [Эксплуатация уязвимости ядра / runc], [Хост / ядро ОС],
      [Exploitation for Privilege Escalation (T1068); Escape to Host (T1611)],
      [Эксплуатация CVE; аномальные syscall unshare, clone, mount; сбой runtime],
      [auditd; eBPF; kernel logs; дамп памяти хоста],

      [Злоупотребление монтированием томов], [Хост],
      [Escape to Host (T1611)],
      [hostPath-монтирование /etc, /proc; запись в хостовые файлы через том],
      [kube-apiserver audit log; PodSpec; docker inspect; mount info],

      // --- Класс 4 ---
      table.cell(rowspan: 3)[Инциденты в оркестраторе],
      [Злоупотребление API и RBAC], [Панель управления],
      [Valid Accounts (T1078); Account Manipulation (T1098)],
      [Запросы от неизвестных SA-токенов; создание ClusterRoleBinding; list secrets; создание привилегированных Pod],
      [kube-apiserver audit log; Role/ClusterRole; RoleBinding],

      [Нарушение политики допуска], [Панель управления],
      [Deploy Container (T1610); Malicious Image (T1204.003)],
      [Запуск образа без подписи; образ не проходил сканирование; запуск из недоверенного реестра],
      [Admission logs; kube-apiserver audit log; PodSpec; policy engine logs],

      [Компрометация etcd], [Панель управления],
      [Data from Information Repositories (T1213)],
      [Прямые запросы к порту 2379 без TLS; несанкционированное чтение/запись ключей вне API-сервера],
      [etcd access log; etcd snapshot; сетевые потоки],

      // --- Класс 5 ---
      table.cell(rowspan: 2)[Сетевые и ресурсные инциденты],
      [Латеральное перемещение], [Сеть],
      [Lateral Movement (TA0008)],
      [Сканирование портов внутри кластера; обращения к соседним Pod по ClusterIP; рост числа внутренних соединений],
      [NetFlow; CNI-логи; Hubble/Cilium telemetry; DNS-логи],

      [Злоупотребление ресурсами], [Ресурсы / оркестратор],
      [Resource Hijacking (T1496); Endpoint Denial of Service (T1499)],
      [Высокая нагрузка на CPU/GPU; DNS-запросы к mining pool; аномальное масштабирование Pod],
      [Метрики CPU/RAM; process list; HPA события; cloud billing logs],
    )
  ],
  caption: [Классификация инцидентов информационной безопасности в контейнерных средах],
) <tbl-incidents>

#pagebreak()

#figure(
  text(size: 9.5pt)[
    #set smartquote(enabled: false)
    #table(
      columns: (0.85fr, 1.1fr, 1.9fr, 1.9fr, 0.62fr, 0.85fr),
      inset: 4pt,
      align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
      stroke: 0.5pt,
      table.header(
        repeat: true,
        strong[Уровень], strong[Тип артефакта], strong[Конкретные данные],
        strong[Механизм получения], strong[Формат], strong[Волатильность],
      ),

      // --- Уровень 1: Контейнер / runtime ---
      table.cell(rowspan: 7)[Контейнер / runtime],
      [Метаданные контейнера],
      [ID, имя, образ, точка входа, CMD, env-переменные, capabilities, привилегированный флаг, bind-mounts, метки жизненного цикла],
      [docker inspect \<id\> / crictl inspect \<id\>], [JSON],
      [Средняя (до удаления)],

      [Файловая система записываемого слоя],
      [Добавленные, изменённые и удалённые файлы относительно образа],
      [docker diff \<id\>; docker export \<id\>; /var/lib/docker/overlay2/\<layer\>/diff/],
      [ФС (архив)], [Высокая (docker rm)],

      [Список процессов],
      [PID-дерево внутри PID-пространства контейнера],
      [docker top \<id\> / crictl exec / /proc/\<host-pid\>/status], [Текстовый / procfs],
      [Максимальная],

      [Сетевые соединения],
      [Открытые TCP/UDP-сокеты, таблицы маршрутизации контейнера],
      [nsenter -t \<pid\> -n ss -tulnp; /proc/\<pid\>/net/tcp], [Текстовый],
      [Максимальная],

      [Переменные окружения],
      [Секреты, токены, конфигурационные параметры контейнера],
      [docker inspect --format '\{\{.Config.Env\}\}'], [Текстовый],
      [Высокая],

      [Журналы стандартного потока вывода],
      [Стандартный вывод приложения],
      [\<id\>-json.log; /var/log/pods/.../0.log], [JSON],
      [Средняя (ротация)],

      [Снимок состояния (CRIU)],
      [Дамп памяти процессов, дескрипторы, сокеты — полный снимок среды выполнения],
      [crictl checkpoint \<id\> / runc checkpoint], [Бинарный (CRIU)],
      [Средняя],

      // --- Уровень 2: Хостовая ОС / ядро ---
      table.cell(rowspan: 6)[Хостовая ОС / ядро],
      [Журналы auditd],
      [Системные вызовы: execve, clone, unshare, mount, open с PID, UID, cgroup],
      [ausearch; /var/log/audit/audit.log], [Текстовый (auditd)],
      [Низкая],

      [eBPF-трассировки],
      [Системные вызовы, сетевые и файловые события с контекстом container ID / Pod],
      [Falco, Tetragon, Tracee (агент на хосте)], [JSON / Protobuf],
      [Максимальная],

      [Журналы демона runtime],
      [Операции жизненного цикла: pull, create, start, stop, remove],
      [journalctl -u docker / -u containerd], [Текстовый (journald)],
      [Низкая],

      [Пространство /proc],
      [Карта памяти, открытые файлы, namespace-идентификаторы процессов контейнера],
      [/proc/\<host-pid\>/ с сопоставлением по cgroup], [procfs],
      [Максимальная],

      [Дамп оперативной памяти],
      [Дамп памяти процесса/хоста: расшифрованные данные, сетевые буферы, следы криптоопераций],
      [/proc/\<pid\>/mem; модуль ядра LiME], [Бинарный],
      [Максимальная],

      [Системные журналы хоста],
      [События ядра, OOM-killer, события cgroups],
      [journalctl; /var/log/syslog], [journald / syslog],
      [Низкая],

      // --- Уровень 3: Оркестратор (Kubernetes) ---
      table.cell(rowspan: 6)[Оркестратор (Kubernetes)],
      [Журнал аудита API-сервера],
      [Каждый запрос к API: субъект, verb, ресурс, sourceIP, метка, код ответа (включая exec, port-forward)],
      [--audit-log-path; в managed — через API провайдера], [JSON],
      [Низкая],

      [События кластера (Events)],
      [Запуск/остановка/вытеснение Pod, сбои планирования, ошибки монтирования],
      [kubectl get events --sort-by=...], [JSON / YAML],
      [Максимальная (TTL 1 ч)],

      [Конфигурации объектов API],
      [PodSpec, Deployment, ConfigMap, Secret, Role, RoleBinding, ServiceAccount],
      [kubectl get \<resource\> -o yaml], [YAML],
      [Низкая],

      [Токены ServiceAccount],
      [JWT-токены, смонтированные в Pod (ns, SA name, exp)],
      [/var/run/secrets/.../token; kubectl get secret], [JWT],
      [Средняя],

      [Снимок etcd],
      [Полное состояние кластера: все объекты API, секреты, RBAC],
      [etcdctl snapshot save], [Бинарный],
      [Низкая (on-prem); недоступен в managed],

      [Журналы kubelet],
      [Операции с Pod на узле: создание, удаление, exec, health check],
      [journalctl -u kubelet], [journald],
      [Низкая],

      // --- Уровень 4: Образ / реестр ---
      table.cell(rowspan: 5)[Образ / реестр],
      [Манифест образа и история слоёв],
      [Последовательность слоёв с digest, метаданные сборки, история команд],
      [docker history --no-trunc; skopeo inspect; crane manifest], [JSON],
      [Низкая],

      [SBOM],
      [Перечень пакетов и зависимостей образа (SPDX / CycloneDX)],
      [Syft; Trivy --format cyclonedx], [JSON / XML],
      [Низкая],

      [Результаты CVE-сканирования],
      [Уязвимости с CVSS для конкретного дайджеста образа],
      [Trivy, Grype, Clair], [JSON],
      [Низкая],

      [Логи реестра образов],
      [Операции push/pull/delete/tag — факт несанкционированной публикации или подмены],
      [Harbor audit log; ECR CloudTrail; Docker Hub activity log], [JSON / CSV],
      [Низкая],

      [Артефакты CI/CD-конвейера],
      [Логи сборки, переменные окружения пайплайна, шаги Dockerfile],
      [GitHub/GitLab CI logs; Dockerfile; lock-файлы], [Текстовый / JSON],
      [Низкая],

      // --- Уровень 5: Сеть / внешние источники ---
      table.cell(rowspan: 5)[Сеть / внешние источники],
      [Сетевые потоки CNI],
      [src/dst IP, порт, протокол, verdict между Pod],
      [Cilium Hubble; Calico flow logs], [JSON],
      [Средняя],

      [eBPF-сетевые события],
      [connect, accept, bind с контекстом Pod; DNS-запросы],
      [Tetragon; Falco (network ruleset)], [JSON / Protobuf],
      [Максимальная],

      [Захват пакетов],
      [Полное содержимое трафика в network namespace контейнера],
      [nsenter -t \<pid\> -n tcpdump -w out.pcap], [PCAP],
      [Максимальная],

      [DNS-журналы],
      [Запросы Pod к CoreDNS — обращения к C2, сканирование имён],
      [CoreDNS query log (плагин log)], [Текстовый],
      [Средняя],

      [Централизованные журналы],
      [Агрегированные журналы, переданные во внешнее хранилище до уничтожения],
      [ELK/EFK; Loki; Splunk], [JSON],
      [Низкая],
    )
  ],
  caption: [Уровневая классификация цифровых артефактов в контейнерных средах],
) <tbl-artifacts>

// ============================================================================
//  ПРИЛОЖЕНИЕ Б — диаграмма последовательности
// ============================================================================

//#appendix-heading("справочное")[Диаграмма последовательности работы системы]

= Диаграмма последовательности работы системы <app-b>

На рисунке @fig-sequence приведена обобщённая UML-диаграмма последовательности будущей системы.

#figure(
  image("assets/sequence_общая.png", width: auto, height: 134mm, fit: "contain"),
  caption: [Обобщённая диаграмма последовательности процесса сбора и анализа цифровых артефактов],
) <fig-sequence>
