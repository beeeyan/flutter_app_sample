plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "work.sendfun.sample.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    sourceSets["main"].java.srcDirs("src/main/kotlin")

    defaultConfig {
        applicationId = "work.sendfun.sample.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // flavorDimensions += "flavor-type"

    // ここを有効化すると「--flavor」をつけることになる
    // iOS側で別設定が必要なので、コメントアウト
    // productFlavors {
    //     create("dev") {
    //         dimension = "flavor-type"
    //         applicationIdSuffix = ".dev"
    //         resValue("string", "app_name", "サンプルアプリ.dev")
    //     }
    //     create("prod") {
    //         dimension = "flavor-type"
    //         applicationIdSuffix = ""
    //         resValue("string", "app_name", "サンプルアプリ")
    //     }
    // }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(kotlin("stdlib"))
}

kotlin {
    jvmToolchain(17)
}