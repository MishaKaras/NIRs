= ПЕРЕЧЕНЬ СОКРАЩЕНИЙ И ОБОЗНАЧЕНИЙ

В настоящем отчете о НИР применяют следующие сокращения и обозначения:

#set par(first-line-indent: 0pt)

#par(
  leading: 0.65em,
  spacing: 0.35em,
)[
  #strong[БД] --- база данных \
  #strong[ВМ] --- виртуальная машина \
  #strong[НИР] --- научно-исследовательская работа \
  #strong[НФТ] --- нефункциональное требование \
  #strong[ОС] --- операционная система \
  #strong[ПО] --- программное обеспечение \
  #strong[ФС] --- файловая система \
  #strong[ФТ] --- функциональное требование \
  #strong[AKS] (англ. #emph[Azure Kubernetes Service]) --- управляемый сервис оркестрации Kubernetes облачной платформы Microsoft Azure \
  #strong[API] (англ. #emph[Application Programming Interface]) --- программный интерфейс приложения \
  #strong[ARP] (англ. #emph[Address Resolution Protocol]) --- протокол разрешения сетевых адресов \
  #strong[AWS] (англ. #emph[Amazon Web Services]) --- облачная платформа компании Amazon \
  #strong[C2] (англ. #emph[Command and Control]) --- командный сервер управления вредоносной активностью \
  #strong[CI/CD] (англ. #emph[Continuous Integration / Continuous Delivery]) --- непрерывная интеграция и непрерывная доставка программного обеспечения \
  #strong[CNCF] (англ. #emph[Cloud Native Computing Foundation]) --- фонд развития облачных и контейнерных технологий \
  #strong[CNI] (англ. #emph[Container Network Interface]) --- стандартный интерфейс организации сетевого взаимодействия контейнеров \
  #strong[CPU] (англ. #emph[Central Processing Unit]) --- центральный процессор \
  #strong[CRD] (англ. #emph[Custom Resource Definition]) --- описание пользовательского ресурса в Kubernetes \
  #strong[CRI] (англ. #emph[Container Runtime Interface]) --- интерфейс взаимодействия оркестратора со средой выполнения контейнеров \
  #strong[CRI-O] --- реализация контейнерной среды выполнения, совместимая с интерфейсом CRI \
  #strong[CRIU] (англ. #emph[Checkpoint/Restore In Userspace]) --- механизм сохранения и восстановления состояния процессов в пространстве пользователя \
  #strong[CVE] (англ. #emph[Common Vulnerabilities and Exposures]) --- реестр общеизвестных уязвимостей информационной безопасности \
  #strong[DFIR] (англ. #emph[Digital Forensics and Incident Response]) --- цифровая криминалистика и реагирование на инциденты \
  #strong[DGA] (англ. #emph[Domain Generation Algorithm]) --- алгоритм автоматической генерации доменных имён \
  #strong[DNS] (англ. #emph[Domain Name System]) --- система доменных имён \
  #strong[eBPF] (англ. #emph[extended Berkeley Packet Filter]) --- технология безопасного выполнения программ в ядре операционной системы без изменения его исходного кода \
  #strong[ECR] (англ. #emph[Elastic Container Registry]) --- реестр контейнерных образов облачной платформы Amazon \
  #strong[EFK] (англ. #emph[Elasticsearch, Fluentd, Kibana]) --- стек централизованного сбора, хранения и анализа журналов \
  #strong[EKS] (англ. #emph[Elastic Kubernetes Service]) --- управляемый сервис оркестрации Kubernetes облачной платформы Amazon \
  #strong[ELK] (англ. #emph[Elasticsearch, Logstash, Kibana]) --- стек централизованного сбора, хранения и анализа журналов \
  #strong[ENI] (англ. #emph[Elastic Network Interface]) --- виртуальный сетевой интерфейс облачной платформы Amazon \
  #strong[GCP] (англ. #emph[Google Cloud Platform]) --- облачная платформа компании Google \
  #strong[GKE] (англ. #emph[Google Kubernetes Engine]) --- управляемый сервис оркестрации Kubernetes облачной платформы Google \
  #strong[GPU] (англ. #emph[Graphics Processing Unit]) --- графический процессор \
  #strong[IoC] (англ. #emph[Indicator of Compromise]) --- индикатор компрометации \
  #strong[IP] (англ. #emph[Internet Protocol]) --- межсетевой протокол \
  #strong[IPC] (англ. #emph[Inter-Process Communication]) --- пространство имён межпроцессного взаимодействия Linux \
  #strong[JSON] (англ. #emph[JavaScript Object Notation]) --- текстовый формат обмена структурированными данными \
  #strong[JWT] (англ. #emph[JSON Web Token]) --- формат токена доступа на основе JSON \
  #strong[L3--L7] --- уровни 3--7 эталонной сетевой модели взаимодействия открытых систем OSI \
  #strong[LiME] (англ. #emph[Linux Memory Extractor]) --- модуль ядра для создания полного дампа оперативной памяти Linux \
  #strong[MITRE ATT\&CK] (англ. #emph[Adversarial Tactics, Techniques, and Common Knowledge]) --- база знаний тактик и техник злоумышленников \
  #strong[NIST] (англ. #emph[National Institute of Standards and Technology]) --- Национальный институт стандартов и технологий США \
  #strong[PID] (англ. #emph[Process Identifier]) --- идентификатор процесса \
  #strong[RAM] (англ. #emph[Random Access Memory]) --- оперативная память \
  #strong[RBAC] (англ. #emph[Role-Based Access Control]) --- управление доступом на основе ролей \
  #strong[REST] (англ. #emph[Representational State Transfer]) --- архитектурный стиль построения сетевых программных интерфейсов \
  #strong[SA] (англ. #emph[Service Account]) --- учётная запись службы в Kubernetes \
  #strong[SBOM] (англ. #emph[Software Bill of Materials]) --- машиночитаемый перечень программных компонентов, входящих в состав образа \
  #strong[SHA-256] (англ. #emph[Secure Hash Algorithm 256-bit]) --- криптографическая хеш-функция с длиной выходного значения 256 бит \
  #strong[SIEM] (англ. #emph[Security Information and Event Management]) --- система управления информацией и событиями информационной безопасности \
  #strong[TCP] (англ. #emph[Transmission Control Protocol]) --- протокол управления передачей данных \
  #strong[TLD] (англ. #emph[Top-Level Domain]) --- домен верхнего уровня \
  #strong[TTL] (англ. #emph[Time To Live]) --- время жизни записи или объекта до автоматического удаления \
  #strong[UID] (англ. #emph[Unique Identifier]) --- уникальный идентификатор объекта \
  #strong[UnionFS] (англ. #emph[Union File System]) --- каскадно-объединённая файловая система \
  #strong[UTC] (англ. #emph[Coordinated Universal Time]) --- всемирное координированное время \
  #strong[VPC] (англ. #emph[Virtual Private Cloud]) --- виртуальное частное облако
]