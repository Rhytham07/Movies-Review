FactoryBot.define do
    factory :movie do
        title {'demo_title'}
        description {'title description'}
        # picture {'movies_image.jpg'}
        association :user, factory: :user
    end
end
