# $NetBSD$

BUILDLINK_TREE+=        mtdev

.if !defined(MTDEV_BUILDLINK3_MK)
MTDEV_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mtdev+=    mtdev>=1.1.0
BUILDLINK_PKGSRCDIR.mtdev?=      ../../wip/mtdev
.endif # MTDEV_BUILDLINK3_MK

BUILDLINK_TREE+=        -mtdev
