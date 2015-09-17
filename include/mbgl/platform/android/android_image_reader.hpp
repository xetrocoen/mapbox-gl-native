#ifndef MBGL_UTIL_ANDROID_IMAGE_READER_HPP
#define MBGL_UTIL_ANDROID_IMAGE_READER_HPP

#include <mbgl/platform/default/image_reader.hpp>

namespace mbgl { namespace util {

class AndroidImageReader : public ImageReader
{

public:
    AndroidImageReader(char const* data, std::size_t size);
    ~AndroidImageReader();
    unsigned width() const;
    unsigned height() const;
    inline bool hasAlpha() const { return true; } // TODO
    bool premultipliedAlpha() const { return true; } // TODO
    void read(unsigned x,unsigned y, unsigned width, unsigned height, char * image);
};

}}

#endif // MBGL_UTIL_ANDROID_IMAGE_READER_HPP
