/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
import std.fs.*
import std.time.*

main(args: Array<String>): Int64 {
    println("${DateTime.now()} ${args}")
    match (args[0]) {
        case "pre-build" => stagePreBuild() // 生成constant.cj
        case "post-build" => stagePostBuild() // 删除constant.cj
        case _ => 0
    }
}

func stagePreBuild(): Int64 {
    ResGen().gen()
    0
}

func stagePostBuild(): Int64 {
    ResGen().delGen()
    0
}

class ResInfo {
    /**
     * @param fileInfo 资源文件信息
     * @param propName 资源文件属性名
     */
    ResInfo(let fileInfo: FileInfo, let resName: String) {}
}

/*
 * res源码生成(字符串)
 */
class ResGen {
    static let resResourcePath = "src/main/resources/resfile" // 用于查找二进制资源文件
    static let resTargetPath = "src/main/cangjie" // 用于查找二进制资源文件  src/main/resources/resfile/constant.txt
    static let fileNameTxt = "/constant.txt"
    static let fileNameCj = "/constant.cj"
    var resFile_: ?File = None

    public func gen(): Unit {
        Directory.walk(resResourcePath, walkResFolder)
        resCountFinish()
    }

    func resCountFinish(): Unit {
        resFile_?.close()
        let srcFile = "${resResourcePath}" + fileNameTxt
        let destFile = "${resTargetPath}" + fileNameCj
        let sf = File(srcFile, OpenMode.Read)
        let df = File(destFile, OpenMode.Write)
        let buffer = Array<Byte>(4096, repeat: 0)
        var readLen = sf.read(buffer)
        while (readLen > 0) {
            df.write(buffer[0..readLen])
            readLen = sf.read(buffer)
        }
        sf.close()
        df.close()
    }

    public func delGen(): Unit {
        Directory.walk(resTargetPath, walkResFolder)
        deleteFinish()
    }

    func deleteFinish(): Unit {
        resFile_?.close()
        let destFile = "${resTargetPath}" + fileNameCj
        if (exists(destFile)) {
            remove(destFile, recursive: true)
        }
    }

    func walkResFolder(f: FileInfo): Bool {
        if (f.isDirectory()) {
            Directory.walk(f.path, walkResFolder)
        }
        true
    }
}