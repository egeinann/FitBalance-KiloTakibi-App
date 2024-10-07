import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  static const defa = Locale("en", "US"); // default dil
  static final languageList = [
    // dil listesi
    const Locale("tr", "TR"),
    const Locale("en", "US"),
    const Locale("es", "ES"),
    const Locale("fr", "FR"),
    const Locale("de", "DE"),
    const Locale("pt", "PT"),
    const Locale("zh", "CN"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'You must pay to see graphs and track your progress in more detail.',
          'Payment': 'Payment',
          'Developer': 'Developer',
          'After 1 week of analysis, the graphs appear!':
              'After 1 week of analysis, the graphs appear!',

          // GalleryScreen
          "You don't have any photos yet !": "You don't have any photos yet !",

          // AddScreen
          "There is already a record for the same date":
              "There is already a record for the same date",
          "Change the date": "Change the date",
          "note": "note",
          "YOUR WEIGHT": "YOUR WEIGHT",
          "kg": "kg",
          "Take a photo": "Take a photo",
          "Pick from gallery": "Pick from gallery",

          // HistoryScreen
          "Record": "Record",
          "Select Month": "Select Month",
          "January": "January",
          "February": "February",
          "March": "March",
          "April": "April",
          "May": "May",
          "June": "June",
          "July": "July",
          "August": "August",
          "September": "September",
          "October": "October",
          "November": "November",
          "December": "December",
          "No records found for this month": "No records found for this month.",
          "Please select a different month.":
              "Please select a different month.",
          "Delete all records !": "Delete all records !",
          "Are you sure all records will be deleted ?":
              "Are you sure all records will be deleted?",
          "You deleted all records": "You deleted all records.",
          "There are no more records": "There are no more records.",

          // FadeNoRecord
          "No record found !": "No record found !",

          // ProfileScreen
          "Weight balance": "Weight balance",
          "Calculate BMI": "Calculate BMI",
          "Male": "Male",
          "Female": "Female",
          "NAME": "NAME",
          "TARGET WEIGHT": "TARGET WEIGHT",

          // Controller
          'Graph': 'Graph',
          'Line Graph': 'Line Graph',
          'Bar Graph': 'Bar Graph',
          'Error Graph': 'Error Graph',
          'Gallery': 'Gallery',
          'Add': 'Add',
          'History': 'History',
          'Profile': 'Profile',
          'App': 'App',

          // SettingsScreen
          'Language': 'Language',
          'Theme': 'Theme',
          'Notifications': 'Notifications',
          'Reminder for process tracking': 'Reminder for process tracking',
          'Privacy Policy': 'Privacy Policy',
          'Protection of personal data': 'Protection of personal data',
          'Terms of service': 'Terms of service',
          'You have accepted these terms': 'You have accepted these terms',
          'Data management': 'Data management',
          'Data backup, restore and data wipe':
              'Data backup, restore and data wipe',
          'About the app': 'About the app',
          'Settings': 'Settings',
        },
        'tr_TR': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Grafikleri görmek ve ilerlemeni daha ayrıntılı takip etmek için ödeme yapmalısın.',
          'Payment': 'Ödeme',
          'Developer': 'Geliştirici',
          'After 1 week of analysis, the graphs appear!':
              '1 haftalık analizden sonra grafikler görünüyor!',

          // GalleryScreen
          "You don't have any photos yet !": "Henüz hiç fotoğrafın yok !",

          // AddScreen
          "There is already a record for the same date":
              "Aynı tarih için zaten bir kayıt var.",
          "Change the date": "Tarihi değiştir.",
          "note": "not",
          "YOUR WEIGHT": "KİLOM",
          "kg": "kg",
          "Take a photo": "Fotoğraf çek.",
          "Pick from gallery": "Galeriden seç.",

          // HistoryScreen
          "Record": "Kayıt",
          "Select Month": "Ay Seç",
          "January": "Ocak",
          "February": "Şubat",
          "March": "Mart",
          "April": "Nisan",
          "May": "Mayıs",
          "June": "Haziran",
          "July": "Temmuz",
          "August": "Ağustos",
          "September": "Eylül",
          "October": "Ekim",
          "November": "Kasım",
          "December": "Aralık",
          "No records found for this month": "Bu ay için kayıt bulunamadı.",
          "Please select a different month.": "Lütfen farklı bir ay seçin.",
          "Delete all records !": "Tüm kayıtları sil!",
          "Are you sure all records will be deleted ?":
              "Tüm kayıtların silineceğinden emin misiniz?",
          "You deleted all records": "Tüm kayıtları sildiniz.",
          "There are no more records": "Başka kayıt yok.",

          // FadeNoRecord
          "No record found !": "Kayıt bulunamadı!",

          // ProfileScreen
          "Weight balance": "Ağırlık dengesi",
          "Calculate BMI": "BKI Hesapla",
          "Male": "Erkek",
          "Female": "Kadın",
          "NAME": "İSİM",
          "TARGET WEIGHT": "HEDEF AĞIRLIK",

          // Controller
          'Graph': 'Grafik',
          'Line Graph': 'Çizgi Grafiği',
          'Bar Graph': 'Çubuk Grafiği',
          'Error Graph': 'Hata Grafiği',
          'Gallery': 'Galeri',
          'Add': 'Ekle',
          'History': 'Geçmiş',
          'Profile': 'Profil',
          'App': 'Uygulama',

          // SettingsScreen
          'Language': 'Dil',
          'Theme': 'Tema',
          'Notifications': 'Bildirimler',
          'Reminder for process tracking': 'Süreç takibi için hatırlatıcı',
          'Privacy Policy': 'Gizlilik Politikası',
          'Protection of personal data': 'Kişisel verilerin korunması',
          'Terms of service': 'Hizmet Şartları',
          'You have accepted these terms': 'Bu şartları kabul ettiniz',
          'Data management': 'Veri yönetimi',
          'Data backup, restore and data wipe':
              'Veri yedekleme, geri yükleme ve veri silme',
          'About the app': 'Uygulama Hakkında',
          'Settings': 'Ayarlar',
        },
        'es_ES': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Debes pagar para ver gráficos y seguir tu progreso en más detalle.',
          'Payment': 'Pago',
          'Developer': 'Desarrollador',
          'After 1 week of analysis, the graphs appear!':
              '¡Después de una semana de análisis, aparecen los gráficos!',

          // GalleryScreen
          "You don't have any photos yet !": "¡Aún no tienes fotos!",

          // AddScreen
          "There is already a record for the same date":
              "Ya hay un registro para la misma fecha.",
          "Change the date": "Cambia la fecha.",
          "note": "nota",
          "YOUR WEIGHT": "TU PESO",
          "kg": "kg",
          "Take a photo": "Tomar una foto.",
          "Pick from gallery": "Elegir de la galería.",

          // HistoryScreen
          "Record": "Registro",
          "Select Month": "Seleccionar mes",
          "January": "Enero",
          "February": "Febrero",
          "March": "Marzo",
          "April": "Abril",
          "May": "Mayo",
          "June": "Junio",
          "July": "Julio",
          "August": "Agosto",
          "September": "Septiembre",
          "October": "Octubre",
          "November": "Noviembre",
          "December": "Diciembre",
          "No records found for this month":
              "No se encontraron registros para este mes.",
          "Please select a different month.": "Por favor selecciona otro mes.",
          "Delete all records !": "¡Eliminar todos los registros!",
          "Are you sure all records will be deleted ?":
              "¿Estás seguro de que se eliminarán todos los registros?",
          "You deleted all records": "Has eliminado todos los registros.",
          "There are no more records": "No hay más registros.",

          // FadeNoRecord
          "No record found !": "¡Registro no encontrado!",

          // ProfileScreen
          "Weight balance": "Equilibrio de peso",
          "Calculate BMI": "Calcular IMC",
          "Male": "Masculino",
          "Female": "Femenino",
          "NAME": "NOMBRE",
          "TARGET WEIGHT": "PESO OBJETIVO",

          // Controller
          'Graph': 'Gráfico',
          'Line Graph': 'Gráfico de líneas',
          'Bar Graph': 'Gráfico de barras',
          'Error Graph': 'Gráfico de error',
          'Gallery': 'Galería',
          'Add': 'Agregar',
          'History': 'Historial',
          'Profile': 'Perfil',
          'App': 'Aplicación',

          // SettingsScreen
          'Language': 'Idioma',
          'Theme': 'Tema',
          'Notifications': 'Notificaciones',
          'Reminder for process tracking':
              'Recordatorio para el seguimiento de procesos',
          'Privacy Policy': 'Política de privacidad',
          'Protection of personal data': 'Protección de datos personales',
          'Terms of service': 'Términos de servicio',
          'You have accepted these terms': 'Has aceptado estos términos',
          'Data management': 'Gestión de datos',
          'Data backup, restore and data wipe':
              'Copia de seguridad de datos, restauración y borrado de datos',
          'About the app': 'Acerca de la aplicación',
          'Settings': 'Ajustes',
        },
        'fr_FR': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Vous devez payer pour voir des graphiques et suivre vos progrès plus en détail.',
          'Payment': 'Paiement',
          'Developer': 'Développeur',
          'After 1 week of analysis, the graphs appear!':
              'Après une semaine d’analyse, les graphiques apparaissent !',

          // GalleryScreen
          "You don't have any photos yet !":
              "Vous n'avez pas encore de photos !",

          // AddScreen
          "There is already a record for the same date":
              "Il y a déjà un enregistrement pour la même date.",
          "Change the date": "Changer la date.",
          "note": "note",
          "YOUR WEIGHT": "VOTRE POIDS",
          "kg": "kg",
          "Take a photo": "Prendre une photo.",
          "Pick from gallery": "Choisir dans la galerie.",

          // HistoryScreen
          "Record": "Enregistrement",
          "Select Month": "Sélectionner le mois",
          "January": "Janvier",
          "February": "Février",
          "March": "Mars",
          "April": "Avril",
          "May": "Mai",
          "June": "Juin",
          "July": "Juillet",
          "August": "Août",
          "September": "Septembre",
          "October": "Octobre",
          "November": "Novembre",
          "December": "Décembre",
          "No records found for this month":
              "Aucun enregistrement trouvé pour ce mois.",
          "Please select a different month.":
              "Veuillez sélectionner un autre mois.",
          "Delete all records !": "Supprimer tous les enregistrements !",
          "Are you sure all records will be deleted ?":
              "Êtes-vous sûr que tous les enregistrements seront supprimés ?",
          "You deleted all records":
              "Vous avez supprimé tous les enregistrements.",
          "There are no more records": "Il n'y a plus d'enregistrements.",

          // FadeNoRecord
          "No record found !": "Aucun enregistrement trouvé !",

          // ProfileScreen
          "Weight balance": "Équilibre du poids",
          "Calculate BMI": "Calculer l'IMC",
          "Male": "Homme",
          "Female": "Femme",
          "NAME": "NOM",
          "TARGET WEIGHT": "POIDS CIBLE",

          // Controller
          'Graph': 'Graphique',
          'Line Graph': 'Graphique en lignes',
          'Bar Graph': 'Graphique en barres',
          'Error Graph': 'Graphique d\'erreur',
          'Gallery': 'Galerie',
          'Add': 'Ajouter',
          'History': 'Historique',
          'Profile': 'Profil',
          'App': 'Application',

          // SettingsScreen
          'Language': 'Langue',
          'Theme': 'Thème',
          'Notifications': 'Notifications',
          'Reminder for process tracking': 'Rappel pour le suivi des processus',
          'Privacy Policy': 'Politique de confidentialité',
          'Protection of personal data': 'Protection des données personnelles',
          'Terms of service': 'Conditions de service',
          'You have accepted these terms': 'Vous avez accepté ces conditions',
          'Data management': 'Gestion des données',
          'Data backup, restore and data wipe':
              'Sauvegarde, restauration et suppression des données',
          'About the app': 'À propos de l\'application',
          'Settings': 'Paramètres',
        },
        'de_DE': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Sie müssen bezahlen, um Diagramme zu sehen und Ihren Fortschritt detaillierter zu verfolgen.',
          'Payment': 'Zahlung',
          'Developer': 'Entwickler',
          'After 1 week of analysis, the graphs appear!':
              'Nach einer Woche der Analyse erscheinen die Diagramme!',

          // GalleryScreen
          "You don't have any photos yet !": "Sie haben noch keine Fotos!",

          // AddScreen
          "There is already a record for the same date":
              "Es gibt bereits einen Datensatz für dasselbe Datum.",
          "Change the date": "Datum ändern.",
          "note": "Notiz",
          "YOUR WEIGHT": "DEIN GEWICHT",
          "kg": "kg",
          "Take a photo": "Ein Foto machen.",
          "Pick from gallery": "Aus der Galerie auswählen.",

          // HistoryScreen
          "Record": "Aufzeichnung",
          "Select Month": "Monat auswählen",
          "January": "Januar",
          "February": "Februar",
          "March": "März",
          "April": "April",
          "May": "Mai",
          "June": "Juni",
          "July": "Juli",
          "August": "August",
          "September": "September",
          "October": "Oktober",
          "November": "November",
          "December": "Dezember",
          "No records found for this month":
              "Keine Aufzeichnungen für diesen Monat gefunden.",
          "Please select a different month.":
              "Bitte wählen Sie einen anderen Monat.",
          "Delete all records !": "Alle Aufzeichnungen löschen!",
          "Are you sure all records will be deleted ?":
              "Sind Sie sicher, dass alle Aufzeichnungen gelöscht werden sollen?",
          "You deleted all records": "Sie haben alle Aufzeichnungen gelöscht.",
          "There are no more records": "Es gibt keine weiteren Aufzeichnungen.",

          // FadeNoRecord
          "No record found !": "Keine Aufzeichnung gefunden!",

          // ProfileScreen
          "Weight balance": "Gewichtsbalanse",
          "Calculate BMI": "BMI berechnen",
          "Male": "Männlich",
          "Female": "Weiblich",
          "NAME": "NAME",
          "TARGET WEIGHT": "ZIELGEWICHT",

          // Controller
          'Graph': 'Diagramm',
          'Line Graph': 'Liniendiagramm',
          'Bar Graph': 'Balkendiagramm',
          'Error Graph': 'Fehlerdiagramm',
          'Gallery': 'Galerie',
          'Add': 'Hinzufügen',
          'History': 'Verlauf',
          'Profile': 'Profil',
          'App': 'App',

          // SettingsScreen
          'Language': 'Sprache',
          'Theme': 'Thema',
          'Notifications': 'Benachrichtigungen',
          'Reminder for process tracking': 'Erinnerung zur Prozessverfolgung',
          'Privacy Policy': 'Datenschutzrichtlinie',
          'Protection of personal data': 'Schutz personenbezogener Daten',
          'Terms of service': 'Nutzungsbedingungen',
          'You have accepted these terms':
              'Sie haben diese Bedingungen akzeptiert',
          'Data management': 'Datenverwaltung',
          'Data backup, restore and data wipe':
              'Datensicherung, Wiederherstellung und Datenlöschung',
          'About the app': 'Über die App',
          'Settings': 'Einstellungen',
        },
        'pt_PT': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Você deve pagar para ver gráficos e acompanhar seu progresso em mais detalhes.',
          'Payment': 'Pagamento',
          'Developer': 'Desenvolvedor',
          'After 1 week of analysis, the graphs appear!':
              'Após uma semana de análise, os gráficos aparecem!',

          // GalleryScreen
          "You don't have any photos yet !": "Você ainda não tem fotos!",

          // AddScreen
          "There is already a record for the same date":
              "Já existe um registro para a mesma data.",
          "Change the date": "Mudar a data.",
          "note": "nota",
          "YOUR WEIGHT": "O SEU PESO",
          "kg": "kg",
          "Take a photo": "Tirar uma foto.",
          "Pick from gallery": "Escolher da galeria.",

          // HistoryScreen
          "Record": "Registro",
          "Select Month": "Selecionar mês",
          "January": "Janeiro",
          "February": "Fevereiro",
          "March": "Março",
          "April": "Abril",
          "May": "Maio",
          "June": "Junho",
          "July": "Julho",
          "August": "Agosto",
          "September": "Setembro",
          "October": "Outubro",
          "November": "Novembro",
          "December": "Dezembro",
          "No records found for this month":
              "Nenhum registro encontrado para este mês.",
          "Please select a different month.":
              "Por favor, selecione um mês diferente.",
          "Delete all records !": "Eliminar todos os registos!",
          "Are you sure all records will be deleted ?":
              "Tem certeza de que todos os registros serão eliminados?",
          "You deleted all records": "Você eliminou todos os registros.",
          "There are no more records": "Não há mais registros.",

          // FadeNoRecord
          "No record found !": "Registro não encontrado!",

          // ProfileScreen
          "Weight balance": "Equilíbrio de peso",
          "Calculate BMI": "Calcular IMC",
          "Male": "Masculino",
          "Female": "Feminino",
          "NAME": "NOME",
          "TARGET WEIGHT": "PESO ALVO",

          // Controller
          'Graph': 'Gráfico',
          'Line Graph': 'Gráfico de linhas',
          'Bar Graph': 'Gráfico de barras',
          'Error Graph': 'Gráfico de erro',
          'Gallery': 'Galeria',
          'Add': 'Adicionar',
          'History': 'Histórico',
          'Profile': 'Perfil',
          'App': 'Aplicativo',

          // SettingsScreen
          'Language': 'Idioma',
          'Theme': 'Tema',
          'Notifications': 'Notificações',
          'Reminder for process tracking':
              'Lembrete para acompanhamento de processos',
          'Privacy Policy': 'Política de privacidade',
          'Protection of personal data': 'Proteção de dados pessoais',
          'Terms of service': 'Termos de serviço',
          'You have accepted these terms': 'Você aceitou estes termos',
          'Data management': 'Gestão de dados',
          'Data backup, restore and data wipe':
              'Backup de dados, restauração e limpeza de dados',
          'About the app': 'Sobre o aplicativo',
          'Settings': 'Configurações',
        },
        'zh_CN': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              '您必须付费才能查看图表并更详细地跟踪您的进度。',
          'Payment': '付款',
          'Developer': '开发者',
          'After 1 week of analysis, the graphs appear!': '经过一周的分析，图表出现！',

          // GalleryScreen
          "You don't have any photos yet !": "您还没有照片！",

          // AddScreen
          "There is already a record for the same date": "同一天已经有记录。",
          "Change the date": "更改日期。",
          "note": "备注",
          "YOUR WEIGHT": "您的体重",
          "kg": "千克",
          "Take a photo": "拍照。",
          "Pick from gallery": "从相册中选择。",

          // HistoryScreen
          "Record": "记录",
          "Select Month": "选择月份",
          "January": "一月",
          "February": "二月",
          "March": "三月",
          "April": "四月",
          "May": "五月",
          "June": "六月",
          "July": "七月",
          "August": "八月",
          "September": "九月",
          "October": "十月",
          "November": "十一月",
          "December": "十二月",
          "No records found for this month": "本月未找到记录。",
          "Please select a different month.": "请选择其他月份。",
          "Delete all records !": "删除所有记录！",
          "Are you sure all records will be deleted ?": "您确定要删除所有记录吗？",
          "You deleted all records": "您已删除所有记录。",
          "There are no more records": "没有更多记录。",

          // FadeNoRecord
          "No record found !": "未找到记录！",

          // ProfileScreen
          "Weight balance": "体重平衡",
          "Calculate BMI": "计算BMI",
          "Male": "男性",
          "Female": "女性",
          "NAME": "名字",
          "TARGET WEIGHT": "目标体重",

          // Controller
          'Graph': '图表',
          'Line Graph': '折线图',
          'Bar Graph': '柱状图',
          'Error Graph': '错误图表',
          'Gallery': '图库',
          'Add': '添加',
          'History': '历史',
          'Profile': '个人资料',
          'App': '应用程序',

          // SettingsScreen
          'Language': '语言',
          'Theme': '主题',
          'Notifications': '通知',
          'Reminder for process tracking': '进程跟踪提醒',
          'Privacy Policy': '隐私政策',
          'Protection of personal data': '个人数据保护',
          'Terms of service': '服务条款',
          'You have accepted these terms': '您已接受这些条款',
          'Data management': '数据管理',
          'Data backup, restore and data wipe': '数据备份、恢复和数据清除',
          'About the app': '关于应用程序',
          'Settings': '设置',
        },
      };
}
