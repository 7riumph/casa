shared_examples_for "shows past court dates links" do
  let(:past_court_date_with_details) do
    create(:past_court_date, :with_court_details, casa_case: casa_case)
  end

  let(:past_court_date_without_details) do
    create(:past_court_date, casa_case: casa_case)
  end

  let!(:formatted_date_with_details) { I18n.l(past_court_date_with_details.date, format: :full, default: nil) }
  let!(:formatted_date_without_details) { I18n.l(past_court_date_without_details.date, format: :full, default: nil) }

  it "shows court mandates" do
    visit edit_casa_case_path(casa_case)

    expect(page).to have_text(formatted_date_with_details)
    expect(page).to have_link(formatted_date_with_details)

    expect(page).to have_text(formatted_date_without_details)
    expect(page).to have_link(formatted_date_without_details)
  end
end
