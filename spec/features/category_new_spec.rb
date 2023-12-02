require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
    before(:each) do
        category = Category.new(name: 'MyString')
        category.icon.attach(io: File.open('spec/fixtures/files/sample_icon.png'), filename: 'sample_icon.png', content_type: 'image/png')
        assign(:category, category)
      end
      

  it 'renders new category form' do
    render

    assert_select 'form[action=?][method=?]', categories_path, 'post' do
      assert_select 'input[name=?]', 'category[name]'

      assert_select 'input[name=?]', 'category[icon]'
    end
  end
end
