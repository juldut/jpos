package com.jpos

import org.apache.commons.lang.builder.HashCodeBuilder

class MloginMloginRole implements Serializable {

	Mlogin mlogin
	MloginRole mloginRole

	boolean equals(other) {
		if (!(other instanceof MloginMloginRole)) {
			return false
		}

		other.mlogin?.id == mlogin?.id &&
			other.mloginRole?.id == mloginRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (mlogin) builder.append(mlogin.id)
		if (mloginRole) builder.append(mloginRole.id)
		builder.toHashCode()
	}

	static MloginMloginRole get(long mloginId, long mloginRoleId) {
		find 'from MloginMloginRole where mlogin.id=:mloginId and mloginRole.id=:mloginRoleId',
			[mloginId: mloginId, mloginRoleId: mloginRoleId]
	}

	static MloginMloginRole create(Mlogin mlogin, MloginRole mloginRole, boolean flush = false) {
		new MloginMloginRole(mlogin: mlogin, mloginRole: mloginRole).save(flush: flush, insert: true)
	}

	static boolean remove(Mlogin mlogin, MloginRole mloginRole, boolean flush = false) {
		MloginMloginRole instance = MloginMloginRole.findByMloginAndMloginRole(mlogin, mloginRole)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Mlogin mlogin) {
		executeUpdate 'DELETE FROM MloginMloginRole WHERE mlogin=:mlogin', [mlogin: mlogin]
	}

	static void removeAll(MloginRole mloginRole) {
		executeUpdate 'DELETE FROM MloginMloginRole WHERE mloginRole=:mloginRole', [mloginRole: mloginRole]
	}

	static mapping = {
		id composite: ['mloginRole', 'mlogin']
		version false
	}
}
