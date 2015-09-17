#include <mbgl/platform/android/android_image_reader.hpp>
#include <mbgl/android/jni.hpp>

namespace mbgl { namespace util {

AndroidImageReader::AndroidImageReader(char const* data, std::size_t size)
    : vm(mbgl::android::theJVM)
{
    JNIEnv *env = nullptr;
    bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::AndroidImageReader()");

    jbyteArray jdata = env->NewByteArray(size);
    if (jdata == nullptr) {
        env->ExceptionDescribe();
        // TODO throw image reader exception
    }

    jbyte* jdataPtr = env->GetByteArrayElements(jdata, nullptr);
    if (jdataPtr == nullptr) {
        env->ExceptionDescribe();
        env->DeleteLocalRef(jdata);
        jdata = nullptr;
        // TODO throw image reader exception
    }

    std::copy(data, data + size, jdataPtr);

    env->ReleaseByteArrayElements(jdata, jdataPtr, 0);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
        env->DeleteLocalRef(jdata);
        jdata = nullptr;
        // TODO throw image reader exception
    }

    obj = env->NewObject(mbgl::android::imageReaderClass, mbgl::android::imageReaderConstructorId, jdata);
    if (obj == nullptr) {
        env->ExceptionDescribe();
        env->DeleteLocalRef(jdata);
        jdata = nullptr;
        // TODO throw image reader exception
    }

    env->DeleteLocalRef(jdata);
    jdata = nullptr;

    obj = env->NewGlobalRef(obj);
    if (obj == nullptr) {
        env->ExceptionDescribe();
        // TODO throw image reader exception
    }

    mbgl::android::detach_jni_thread(vm, &env, detach);
}

AndroidImageReader::~AndroidImageReader()
{
        JNIEnv *env = nullptr;
        bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::~AndroidImageReader()");

        env->DeleteGlobalRef(obj);
        obj = nullptr;

        mbgl::android::detach_jni_thread(vm, &env, detach);

        vm = nullptr;
}

unsigned AndroidImageReader::width() const
{
    JNIEnv *env = nullptr;
    bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::width()");

    jint width = env->CallIntMethod(obj, mbgl::android::imageReaderGetWidthId);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
    }

    mbgl::android::detach_jni_thread(vm, &env, detach);

    return width;
}

unsigned AndroidImageReader::height() const
{
    JNIEnv *env = nullptr;
    bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::height()");

    jint height = env->CallIntMethod(obj, mbgl::android::imageReaderGetHeightId);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
    }

    mbgl::android::detach_jni_thread(vm, &env, detach);

    return height;
}

bool AndroidImageReader::hasAlpha() const
{
    JNIEnv *env = nullptr;
    bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::hasAlpha()");

    jboolean hasAlpha = env->CallBooleanMethod(obj, mbgl::android::imageReaderHasAlphaId);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
    }

    mbgl::android::detach_jni_thread(vm, &env, detach);

    return hasAlpha;
}

bool AndroidImageReader::premultipliedAlpha() const
{
    JNIEnv *env = nullptr;
    bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::premultipliedAlpha()");

    jboolean premultipliedAlpha = env->CallBooleanMethod(obj, mbgl::android::imageReaderPremultipliedAlphaId);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
    }

    mbgl::android::detach_jni_thread(vm, &env, detach);

    return premultipliedAlpha;
}

void AndroidImageReader::read(unsigned x0, unsigned y0, unsigned w, unsigned h, char * image)
{
    JNIEnv *env = nullptr;
    bool detach = mbgl::android::attach_jni_thread(vm, &env, "AndroidImageReader::read()");

    // TODO throw exception if parameters too big
    jintArray jimage = reinterpret_cast<jintArray>(env->CallObjectMethod(obj, mbgl::android::imageReaderReadId, x0, y0, w, h));
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
    }

    jint* jimagePtr = env->GetIntArrayElements(jimage, nullptr);
    if (jimagePtr == nullptr) {
        env->ExceptionDescribe();
        env->DeleteLocalRef(jimage);
        jimage = nullptr;
        // TODO throw image reader exception
    }

    // TODO int to byte array
    std::copy(jimagePtr, jimagePtr + (w * h), image);

    env->ReleaseIntArrayElements(jimage, jimagePtr, JNI_ABORT);
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
        env->DeleteLocalRef(jimage);
        jimage = nullptr;
        // TODO throw image reader exception
    }

    env->DeleteLocalRef(jimage);
    jimage = nullptr;

    mbgl::android::detach_jni_thread(vm, &env, detach);
}

std::unique_ptr<ImageReader> getImageReader(char const* data, size_t size)
{
    return std::make_unique<AndroidImageReader>(data, size);
}

}}
