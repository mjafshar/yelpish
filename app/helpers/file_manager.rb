class FileManager
  def self.create_photo_dir
    file_manager = NSFileManager.alloc.init
    file_manager.createDirectoryAtPath(PHOTOS_SMALL, withIntermediateDirectories:false, attributes:nil, error:nil)
  end

  def self.destroy_all
    file_manager = NSFileManager.alloc.init
    files = file_manager.contentsOfDirectoryAtPath(PHOTOS_SMALL,error:nil)
    files.each do |file|
      file_path = "#{PHOTOS_SMALL}#{file}"
      file_manager.removeItemAtPath(file_path,error:nil)
    end
  end
end
