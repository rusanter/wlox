UPDATE app_configuration 
SET frontend_dirroot = '/var/www/html/', 
    api_dirroot = '/var/www/html/', 
    cron_dirroot = '/app/', 
    backstage_dirroot = '/var/www/html/',
    withdrawals_btc_manual_approval = 'Y',
    withdrawals_fiat_manual_approval = 'Y',
    cloudflare_blacklist = 'Y';
