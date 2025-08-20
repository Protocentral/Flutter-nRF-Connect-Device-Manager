package no.nordicsemi.android.mcumgr_flutter.utils

import java.lang.IllegalArgumentException

/** Methods which Flutter sends to platform side. */
@Suppress("EnumEntryName")
enum class FlutterMethod {
	update,
	updateSingleImage,
	initializeUpdateManager,
	initializeFsManager,
	pause,
	resume,
	isPaused,
	isInProgress,
	cancel,
	readLogs,
	clearLogs,
	kill,
	readImageList;
	// fs manager methods could also be called via method channel as bytes
	fsList,
	fsStat,
	fsRemove,
	fsOpen,
	fsRead,
	fsWrite,
	fsClose,
	killFsManager;

	companion object {
		fun valueOfOrNull(string: String) = try {
			valueOf(string)
		} catch (e: IllegalArgumentException) {
			null
		}
	}
}

/** Methods which platform sends to Flutter. */
@Suppress("EnumEntryName")
enum class PlatformMethod {
	log;

	companion object {
		fun valueOfOrNull(string: String) = try {
			valueOf(string)
		} catch (e: IllegalArgumentException) {
			null
		}
	}
}