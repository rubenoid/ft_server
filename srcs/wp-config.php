<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'ruben' );

/** MySQL database password */
define( 'DB_PASSWORD', '123412341234' );

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
define('AUTH_KEY',         '-s;(w|Jt[A5RcJ01o+!~1M:]Q~}WlFR|~/?[+&#/u#lxn+[7+hx]zxY)?o(xAI|w');
define('SECURE_AUTH_KEY',  ' y3 ),J]Nzwc_LQOtcvRDmxA_D1E+-EV~FL+;C@nBt1|roW_=Ke}9g&s.W~*0f{l');
define('LOGGED_IN_KEY',    'zo-mG*O%J-n{(ZEDoFt2Dk$uMlZa|N]lA|B^%$avCcPDI.+S fr<%RY?Cy_Gu[Db');
define('NONCE_KEY',        'Vr-OMBp#8K:]]#m%m;@+C#g5m:Rk)Vc%g6v3I7R%-|(t|;zrQ!x#iN2yG3b+#B`{');
define('AUTH_SALT',        '(Su7u,+lqPWIJ}bczT+-[hqND#%L}i|`|;,soFfPE=d@lUv=HE8;#8-W|i?l>hDE');
define('SECURE_AUTH_SALT', 'ATQH)jzVw7g|qetUS(<dk#8`,8|RIE!UQ/hqJLYHSnsvm7S_)Muff>M~|d@KL[1 ');
define('LOGGED_IN_SALT',   'lC+NjMGtEjzs?13a-elc<:TS3ZVs$E!iR-Lx82]cvjF**R[^UITZFk|N+ 7jA>EG');
define('NONCE_SALT',       '!})F_XCR+o<th)J+F(Q|]V}`*Ehk>n^F]-IOJ-2.m,.t1Y/rkWVF8%R`];oQ|GZv');



/**#@-*/

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
