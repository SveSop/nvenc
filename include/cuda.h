/*
 * Copyright (C) 2015 Sebastian Lackner
 * Copyright (C) 2025 Sveinar Søpler
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
 */

#ifndef __WINE_CUDA_H
#define __WINE_CUDA_H

#include <stdint.h>
typedef uint32_t cuuint32_t;
typedef uint64_t cuuint64_t;

#define CUDA_SUCCESS                 0
#define CUDA_ERROR_INVALID_VALUE     1
#define CUDA_ERROR_OUT_OF_MEMORY     2
#define CUDA_ERROR_INVALID_CONTEXT   201
#define CUDA_ERROR_NO_BINARY_FOR_GPU 209
#define CUDA_ERROR_FILE_NOT_FOUND    301
#define CUDA_ERROR_INVALID_HANDLE    400
#define CUDA_ERROR_NOT_SUPPORTED     801
#define CUDA_ERROR_UNKNOWN           999

typedef int CUresult;
typedef void *CUcontext;

#endif /* __WINE_CUDA_H */
