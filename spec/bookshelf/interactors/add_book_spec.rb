RSpec.describe AddBook do
  let(:interactor) { AddBook.new }
  let(:attributes) { Hash[author: "James Baldwin", title: "The Fire Next Time"] }

  context "good imput" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be (true)
    end

    it "creates a Book with correct title and author" do
      expect(result.book.title).to eq("The Fire Next Time")
      expect(result.book.author).to eq("James Baldwin")
    end

  end

  context "persistence" do
    let(:repository) { instance_double("BookRepository")}

    it "persists the Book" do
      expect(repository).to receive(:create)
      AddBook.new(repository: repository).call(attributes)
    end
  end

end
