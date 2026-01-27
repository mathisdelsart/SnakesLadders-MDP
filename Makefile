.PHONY: install clean run run-simulate run-analysis help

# Python interpreter
PYTHON = python3

help:
	@echo "Snakes and Ladders - MDP & Q-Learning"
	@echo ""
	@echo "Setup:"
	@echo "  make install       Install all dependencies"
	@echo "  make venv          Create virtual environment"
	@echo ""
	@echo "Run:"
	@echo "  make run           Run main demonstration"
	@echo "  make run-simulate  Run full simulation with all strategies"
	@echo "  make run-analysis  Run strategy analysis plots"
	@echo ""
	@echo "Utilities:"
	@echo "  make clean         Remove cache and temporary files"
	@echo "  make help          Show this help message"

install:
	$(PYTHON) -m pip install -r requirements.txt

venv:
	$(PYTHON) -m venv venv
	./venv/bin/pip install --upgrade pip
	./venv/bin/pip install -r requirements.txt
	@echo ""
	@echo "Virtual environment created. Activate with: source venv/bin/activate"

run:
	$(PYTHON) main.py

run-simulate:
	$(PYTHON) simulate.py

run-analysis:
	PYTHONPATH=. $(PYTHON) plotter/strategy_analysis.py

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name ".DS_Store" -delete 2>/dev/null || true
	@echo "Cleaned up cache and temporary files"
