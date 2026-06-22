require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    post = Post.new(title: "Test Post", body: "This is a test body.")
    assert post.valid?
  end

  test "is invalid without a title" do
    post = Post.new(body: "Body without title")
    assert_not post.valid?
    assert_includes post.errors[:title], "can't be blank"
  end

  test "is invalid without a body" do
    post = Post.new(title: "Title without body")
    assert_not post.valid?
    assert_includes post.errors[:body], "can't be blank"
  end

  test "is invalid with a title shorter than 3 characters" do
    post = Post.new(title: "AB", body: "Some body text")
    assert_not post.valid?
    assert_includes post.errors[:title], "is too short (minimum is 3 characters)"
  end

  test "published scope returns only published posts" do
    Post.destroy_all
    published = Post.create!(title: "Published Post", body: "Body", published: true, published_at: Time.current)
    Post.create!(title: "Draft Post", body: "Body", published: false)

    assert_equal [ published ], Post.published.to_a
  end

  test "draft scope returns only unpublished posts" do
    Post.destroy_all
    Post.create!(title: "Published Post", body: "Body", published: true, published_at: Time.current)
    draft = Post.create!(title: "Draft Post", body: "Body", published: false)

    assert_equal [ draft ], Post.draft.to_a
  end
end
