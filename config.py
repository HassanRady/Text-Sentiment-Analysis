from pydantic_settings import BaseSettings
from functools import lru_cache
import os

class Settings(BaseSettings):
    KAFKA_BOOTSTRAP_SERVERS: str
    KAFKA_CLEANED_TEXT_TOPIC: str
    KAFKA_SENTIMENT_TOPIC: str
    SENTIMENT_MODEL_URL: str
    KAFKA_SENTIMENT_CONSUMER_GROUP: str
    KAFKA_AUTO_OFFSET_RESET: str


@lru_cache()
def get_settings():
    return Settings()

settings = get_settings()