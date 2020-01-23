<?php
if (!empty($argv)) {
  array_shift($argv);
  parse_str(implode('&', $argv), $_GET);
}

$profile_id = array_key_exists('feed_id', $_GET) && !empty($_GET['feed_id']) ? $_GET['feed_id'] : die('Error: "feed_id" param found');

cron_start($profile_id);

function cron_start($profile_id) {
    define('PROFILE_ID', $profile_id);
    define('ROOT_PATH', getRootPath());
    define('VERSION', getOcVersion());
    if (is_file(ROOT_PATH . 'config.php')) {
        require_once(ROOT_PATH . 'config.php');
    }

    $_GET['route'] = 'extension/module/google_all_feed';

    if(version_compare(VERSION, '2.3', '>=')) {
        require_once(DIR_SYSTEM . 'startup.php');
        $application_config = 'catalog';
        if(is_file(DIR_MODIFICATION . 'system/framework.php'))
            require_once(DIR_MODIFICATION . 'system/framework.php');
        else
            require_once(DIR_SYSTEM . 'framework.php');

    } else {
        if(version_compare(VERSION, '2', '>='))
            manual_call_2x(CRON_GMT_ACTION);
        else
            manual_call_1x(CRON_GMT_ACTION);
    }
}

function getRootPath() {
    $path = str_replace('catalog/controller/extension/module/gmt_cron.php', '',  __FILE__);
    return $path;
}
function getOcVersion() {
    $index_content = file_get_contents(ROOT_PATH.'index.php');
    $pattern = "/^.*\bVERSION\b.*$/m";

    $matches = array();
    preg_match($pattern, $index_content, $matches);

    if(empty($matches))
        die("#1 - Opencart version not found");
    preg_match_all('!\d+!', $matches[0], $matches);

    if(empty($matches))
        die("#2 - Opencart version not found");

    $version = implode('.', $matches[0]);

    return $version;
}

function manual_call_2x($action) {
    // Startup
    require_once(DIR_SYSTEM . 'startup.php');

    // Registry
    $registry = new Registry();

    // Config
    $config = new Config();
    $registry->set('config', $config);

    // Database
    $db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, DB_PORT);
    $registry->set('db', $db);

    // Settings
    $query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");

    foreach ($query->rows as $setting) {
        if (!$setting['serialized']) {
            $config->set($setting['key'], $setting['value']);
        } else {
            $config->set($setting['key'], json_decode($setting['value'], true));
        }
    }

    // Loader
    $loader = new Loader($registry);
    $registry->set('load', $loader);

    // Url
    $url = new Url(HTTP_SERVER, $config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER);
    $registry->set('url', $url);

    // Log
    $log = new Log($config->get('config_error_filename'));
    $registry->set('log', $log);

    // Request
    $request = new Request();
    $registry->set('request', $request);

    // Response
    $response = new Response();
    $response->addHeader('Content-Type: text/html; charset=utf-8');
    $registry->set('response', $response);

    // Cache
    $cache = new Cache('file');
    $registry->set('cache', $cache);

    // Session
    $session = new Session();
    $registry->set('session', $session);

    // Language
    $languages = array();

    $query = $db->query("SELECT * FROM `" . DB_PREFIX . "language`");

    foreach ($query->rows as $result) {
        $languages[$result['code']] = $result;
    }

    $config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

    // Language
    $language = new Language($languages[$config->get('config_admin_language')]['directory']);
    $language->load($languages[$config->get('config_admin_language')]['directory']);
    $registry->set('language', $language);

    // Event
    $event = new Event($registry);
    $registry->set('event', $event);

    // Front Controller
    $controller = new Front($registry);

    $action = new Action($action);
    $controller->dispatch($action, new Action('error/not_found'));

    // Output
    $response->output();
}

function manual_call_1x($action) {
    // Startup
    require_once(DIR_SYSTEM . 'startup.php');

    // Application Classes
    require_once(DIR_SYSTEM . 'library/currency.php');
    require_once(DIR_SYSTEM . 'library/user.php');
    require_once(DIR_SYSTEM . 'library/weight.php');
    require_once(DIR_SYSTEM . 'library/length.php');

    // Registry
    $registry = new Registry();

    // Loader
    $loader = new Loader($registry);
    $registry->set('load', $loader);

    // Config
    $config = new Config();
    $registry->set('config', $config);

    // Database
    $db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
    $registry->set('db', $db);

    // Settings
    $query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");

    foreach ($query->rows as $setting) {
        if (!$setting['serialized']) {
            $config->set($setting['key'], $setting['value']);
        } else {
            $config->set($setting['key'], unserialize($setting['value']));
        }
    }

    // Url
    $url = new Url(HTTP_SERVER, $config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER);
    $registry->set('url', $url);

    // Log
    $log = new Log($config->get('config_error_filename'));
    $registry->set('log', $log);

    // Request
    $request = new Request();
    $registry->set('request', $request);

    // Response
    $response = new Response();
    $response->addHeader('Content-Type: text/html; charset=utf-8');
    $registry->set('response', $response);

    // Cache
    $cache = new Cache();
    $registry->set('cache', $cache);

    // Session
    $session = new Session();
    $registry->set('session', $session);

    // Language
    $languages = array();

    $query = $db->query("SELECT * FROM `" . DB_PREFIX . "language`");

    foreach ($query->rows as $result) {
        $languages[$result['code']] = $result;
    }

    $config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

    // Language
    $language = new Language($languages[$config->get('config_admin_language')]['directory']);
    $language->load($languages[$config->get('config_admin_language')]['filename']);
    $registry->set('language', $language);

    // Document
    $registry->set('document', new Document());

    // Currency
    $registry->set('currency', new Currency($registry));

    // Weight
    $registry->set('weight', new Weight($registry));

    // Length
    $registry->set('length', new Length($registry));

    // User
    $registry->set('user', new User($registry));

    //OpenBay Pro
    $registry->set('openbay', new Openbay($registry));

    // Front Controller
    $controller = new Front($registry);

    $action = new Action($action);
    // Dispatch
    $controller->dispatch($action, new Action('error/not_found'));

    // Output
    $response->output();
}
?>