schema "0003 add address info" do

  entity "Business" do

    string :name
    string :photo_url_small
    float :distance
    boolean :is_closed
    string :category
    string :mobile_url
    string :image_path
    string :address

  end
end
