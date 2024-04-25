<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'obqLMoI9~B*s|%cJ/>t+H{6-*uMv[DJ?zS/AmJmE(:`0e}(A58D}{lYZ%tE271Ub');
define('SECURE_AUTH_KEY',  'O6Opw0T-+Vcat)_Ta[s2nyj]U$8Ruq&tR&@`{46z2H0l@+0~y1Wn]{a~<cL$+C-3');
define('LOGGED_IN_KEY',    '9JUh_i1[eC;x8H!3`z31WP|zzNr4V##{&L?X4I4Vf0sH|T-q:|PM((b]|cI|9Ev1');
define('NONCE_KEY',        '4d |srI~q&h1AxYg$X<Dlr?5%k.{ipQ(Ib{8(md:[O#]28$i(Y[<Lpa-a)|_U}$G');
define('AUTH_SALT',        '|PQWU|2i0Y P|}Gt|$iN:IyZi[,su2A?0/@7KI-p3oO.g@g<0m:9O{)L5SfTKjw+');
define('SECURE_AUTH_SALT', 'TE*$r~|y,LU)1=E> @59<Y7%87Cqyu>_}IzUm-oO|`C|Q&U+g{ETM)lbRUWTlDeC');
define('LOGGED_IN_SALT',   'LR~7[ARo&P)exp;>mL?W`7{G~Za}Ot(;(hE|xcC(fsyDC)8e<|+`!s&&#1+ve3V[');
define('NONCE_SALT',       'L paIJ.=qBnO<n,>({E69D56-E=jK2!LDe~1ZU%<yE-~I$FHU}[Q6w8lfT8N|7 R');


/**#@-*/

/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
