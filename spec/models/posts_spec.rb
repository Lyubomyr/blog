require 'rails_helper'

RSpec.describe Post, type: :model do
  it "validate title" do
    post = Post.create(text: "2")
    expect(post.errors.full_messages).to eq(["Title can't be blank"])
    expect(Post.count).to eq(0)

    post = Post.create(title: "1", text: "2")
    expect(post.errors.full_messages).to eq([])
    expect(post.title).to eq("1")
  end

  it "big_title return humanized title" do
    post = Post.create(title: "name", text: "2")
    expect(post.title).to eq("Name")
  end
end
