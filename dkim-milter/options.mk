# $NetBSD: options.mk,v 1.1.1.1 2005/09/28 15:28:16 imilh Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.dk-milter
PKG_SUPPORTED_OPTIONS=	inet6

.include "../../mk/bsd.options.mk"

###
### IPv6 support.
###
.if !empty(PKG_OPTIONS:Minet6)
SUBST_SED.libs+=	-e 's|@INET6@||'
.else
SUBST_SED.libs+=	-e 's|@INET6@|dnl|'
.endif
