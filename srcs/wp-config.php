<?php

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );
/** MySQL database username */
define( 'DB_USER', 'sde-kok' );
/** MySQL database password */
define( 'DB_PASSWORD', 'password' );
/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'VH^fC_FuZ<]SN=]ESnn+0yrQ67uj>hQQ~4.&~M?/E<zaYatvXbiKU5o3Jm2nN*cM');
define('SECURE_AUTH_KEY',  '<|Nd)w~E1TH-9M8_ao,y:jjzwO>_Wt|u +|7$mPc3XwY<C; 7#e3rK270tj%:mqh');
define('LOGGED_IN_KEY',    'nuk~pwa yI MBzwEe%|iB<fDwdooJHj2 z [S2U1p=jf4)Fau*btO*WCn@!Yrkz$');
define('NONCE_KEY',        '_`SV0WfX]9zopyhzUlAwb*,<h CRM.9%>HP:n61a-Z$51K&rNnv&#A,HOCPz!]|o');
define('AUTH_SALT',        'JNA.+!PH,yb-j8K}eKbrIHd=%CxS[wtf4S(C84QtTjJF:g[|+QH88=o?X)gE!jv$');
define('SECURE_AUTH_SALT', '08B2|:+*WMjP]nV~E;Fk;7HAzv]/i@sg^c8PFU{J[vXj=UCQ374ZI+!qZc=?+5b#');
define('LOGGED_IN_SALT',   'pw1(-nDQCIFU8:l~+B/r(`4M2}~;-W+KpJtFYc*yy3O9-0=i2<Sk7lqQ~(IVthh-');
define('NONCE_SALT',       'H/V8v3j3C-_MG{Go`j?|ccxm(|K&[Y&e-R25^H9Cf1dq`(5*Vp1bTUGVNmy5W9K-');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */

$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */

define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );