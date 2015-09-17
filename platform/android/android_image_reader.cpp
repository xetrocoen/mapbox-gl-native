#include <mbgl/platform/android/android_image_reader.hpp>

namespace mbgl { namespace util {

AndroidImageReader::AndroidImageReader(char const* data, std::size_t size)
{
    // TODO
}

AndroidImageReader::~AndroidImageReader() {}

unsigned AndroidImageReader::width() const
{
    return 0; // TODO
}

unsigned AndroidImageReader::height() const
{
    return 0; // TODO
}

void AndroidImageReader::read(unsigned x0, unsigned y0, unsigned w, unsigned h, char * image)
{
}

std::unique_ptr<ImageReader> getImageReader(char const* data, size_t size)
{
    return std::make_unique<AndroidImageReader>(data, size);
}

}}
