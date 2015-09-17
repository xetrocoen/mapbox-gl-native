#ifndef MBGL_UTIL_ANDROID_IMAGE_READER_HPP
#define MBGL_UTIL_ANDROID_IMAGE_READER_HPP

#include <jni.h>

#include <mbgl/platform/default/image_reader.hpp>

namespace mbgl { namespace util {

class AndroidImageReader : public ImageReader
{
private:
    JavaVM *vm = nullptr;
    jobject obj = nullptr;

public:
    AndroidImageReader(char const* data, std::size_t size);
    ~AndroidImageReader();
    unsigned width() const;
    unsigned height() const;
    bool hasAlpha() const;
    bool premultipliedAlpha() const;
    void read(unsigned x,unsigned y, unsigned width, unsigned height, char * image);
};

}}

#endif // MBGL_UTIL_ANDROID_IMAGE_READER_HPP
