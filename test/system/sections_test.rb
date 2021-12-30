require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "creating a Section" do
    visit sections_url
    click_on "New Section"

    fill_in "Duration", with: @section.duration
    fill_in "Room", with: @section.room_id
    fill_in "Start at", with: @section.start_at
    fill_in "Subject", with: @section.subject_id
    fill_in "Teacher", with: @section.teacher_id
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "updating a Section" do
    visit sections_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @section.duration
    fill_in "Room", with: @section.room_id
    fill_in "Start at", with: @section.start_at
    fill_in "Subject", with: @section.subject_id
    fill_in "Teacher", with: @section.teacher_id
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "destroying a Section" do
    visit sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section was successfully destroyed"
  end
end
